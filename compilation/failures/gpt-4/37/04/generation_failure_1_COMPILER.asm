; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzn3xlh0e.asm:15:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align 2
_customFunction:
// Save link register and caller saved registers
stp x30, x19, [sp, #-16]!    // Save x30 (LR) and x19 (a temporary register) to the stack
stp x0, x1, [sp, #-16]!     // Save int1 and int2 to the stack
stp d0, d1, [sp, #-16]!     // Save double1 and double2 to the stack

// Check if int1 < 5
cmp w0, #5
blt .less_than_5

// Else branch: customFunction(int1-2, int2, double1+1, double2, outInt, outDouble)
sub w0, w0, #2               // int1 = int1 - 2
fadd d0, d0, #1.0           // Load 1.0 into a FP register and then add to double1
bl _customFunction           // Branch to customFunction

// Restore saved registers and return
ldp d0, d1, [sp], #16
ldp x0, x1, [sp], #16
ldp x30, x19, [sp], #16
ret

.less_than_5:
// Then branch: *outInt = int1 + int2; *outDouble = double2;
ldr w19, [sp, #16]          // Load int2 into w19
add w19, w0, w19            // w19 = int1 + int2
str w19, [x2]               // Store result to *outInt

str d1, [x3]                // Store double2 to *outDouble

// Restore saved registers and return
ldp d0, d1, [sp], #16
ldp x0, x1, [sp], #16
ldp x30, x19, [sp], #16
ret
