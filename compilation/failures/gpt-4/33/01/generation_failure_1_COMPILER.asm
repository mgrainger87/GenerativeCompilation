; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwt62u74p.asm:14:15: error: unexpected floating point literal
; fsub d0, d0, #0.5
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwt62u74p.asm:15:15: error: unexpected floating point literal
; fadd d1, d1, #0.5
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!   // Push x19 and x20 onto the stack
stp x21, x22, [sp, #-16]!   // Push x21 and x22 onto the stack
stp x29, x30, [sp, #-16]!   // Push x29 (frame pointer) and x30 (link register) onto the stack
mov x29, sp                 // Set frame pointer

// Check if double1 (d0) is <= 0
fcmp d0, #0.0
ble 1f                      // Branch to label 1 if the condition is met

// Recursive call
fsub d0, d0, #0.5           // This is not a valid instruction, we need to move the immediate value into a floating-point register first
fadd d1, d1, #0.5           // This is also not a valid instruction, let's handle these next

// Load the immediate floating point values
adr x19, 2f                 // Load address of the constants into x19
ldr d4, [x19]               // Load the value -0.5 into d4
ldr d5, [x19, #8]           // Load the value 0.5 into d5

fsub d0, d0, d4             // Subtract 0.5 from double1
fadd d1, d1, d5             // Add 0.5 to double2

bl _customFunction          // Call customFunction recursively

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16     // Pop x29 and x30 from the stack
ldp x21, x22, [sp], #16     // Pop x21 and x22 from the stack
ldp x19, x20, [sp], #16     // Pop x19 and x20 from the stack
ret

1:  // Else branch
add w4, w0, w1              // w4 = int1 + int2
str w4, [x2]                // *outInt = w4
str d1, [x3]                // *outDouble = double2

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16     // Pop x29 and x30 from the stack
ldp x21, x22, [sp], #16     // Pop x21 and x22 from the stack
ldp x19, x20, [sp], #16     // Pop x19 and x20 from the stack
ret

2:  .double -0.5, 0.5          // Constants for floating point operations
