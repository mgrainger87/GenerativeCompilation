; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpfqucud22.asm:15:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction

_customFunction:
// Prologue: Save the frame pointer, link register, and other necessary registers
stp x29, x30, [sp, #-16]!
mov x29, sp
stp x19, x20, [sp, #-16]! // Save callee-saved registers

// Compare int1 with 5
cmp w0, #5
blt .lessThan5

// Recursive function call branch
sub w0, w0, #2   // int1-2
fadd d0, d0, #1.0  // double1+1
// Use bl to call customFunction again
bl _customFunction

// Epilogue: Restore the frame pointer, link register, and other registers
ldp x19, x20, [sp], #16
ldp x29, x30, [sp], #16
ret

.lessThan5:
// *outInt = int1 + int2
add w19, w0, w1
str w19, [x2]

// *outDouble = double2
fmov d19, d1
str d19, [x3]

// Epilogue for lessThan5 branch
ldp x19, x20, [sp], #16
ldp x29, x30, [sp], #16
ret
