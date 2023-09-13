; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp4waearrj.asm:20:1: error: unknown directive
; .size customFunction, .-customFunction
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .text
.align 2
.global customFunction
customFunction:
// x0 = int1
// x1 = int2
// d0 = double1
// d1 = double2
// x2 = _outInt
// x3 = _outDouble

stp x29, x30, [sp,#-16]!
mov x29, sp

str w0, [x2]   // store int1 to _outInt
fmov d0, d0     // store double1 to _outDouble

ldp x29, x30, [sp], #16
ret
.size customFunction, .-customFunction
