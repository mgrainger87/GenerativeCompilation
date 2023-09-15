; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7h22475w.asm:13:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global customFunction
customFunction:
// Save link register and required callee-saved registers
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Check the condition (int2 < 5)
cmp     w1, #5
blt     .LessThan5

// Else part (Recursive call)
sub     w1, w1, #2       // int2 = int2 - 2
fsub    d1, d1, #1.0     // double2 = double2 - 1.0
bl      customFunction  // Recursive call
ldp     x29, x30, [sp], #16  // Restore registers
ret

.LessThan5:
// *outInt = int1
str     w0, [x2]

// *outDouble = double1 + double2
fadd    d4, d0, d1
str     d4, [x3]

ldp     x29, x30, [sp], #16  // Restore registers
ret
