; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpq8xwdkfs.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpq8xwdkfs.asm:20:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl  _customFunction
.align  3
_customFunction:
// Save the link register
stp     lr, [sp, #-16]!

// Multiply int2 by itself
mul     w4, w1, w1

// Store result in *outInt
str     w4, [x2]

// Multiply double1 by itself
fmul    d4, d0, d0

// Store result in *outDouble
str     d4, [x3]

// Restore the link register
ldp     lr, [sp], #16

ret
