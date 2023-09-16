; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzi07ytb0.asm:22:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzi07ytb0.asm:23:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
.align 2
_customFunction:
// Save callee-saved registers and link register
stp x29, x30, [sp, #-16]!  // Store pair of 64-bit registers to memory and update stack pointer
mov x29, sp               // Set up frame pointer

// Check if double2 (d1) < 10
fmov d2, #10.0            // Load immediate floating point value 10 into d2
fcmp d1, d2               // Compare double2 with 10
b.ge .Lelse               // If double2 >= 10, branch to the else part

// If part starts here
str w1, [x2]              // Store int2 to the location pointed by outInt
fmul d3, d0, d1           // Multiply double1 with double2 and store in d3
str d3, [x3]              // Store the result to the location pointed by outDouble
b .Lend                   // Branch to the end of the function

// Else part starts here
.Lelse:
add w0, w0, #2            // Add 2 to int1
fadd d0, d0, #1.0         // Add 1 to double1
fsub d1, d1, #1.0         // Subtract 1 from double2
bl _customFunction        // Call customFunction recursively

.Lend:
// Restore callee-saved registers and link register
ldp x29, x30, [sp], #16   // Load pair of 64-bit registers from memory and update stack pointer
ret                       // Return from function
