; compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: 1000
; 	Integer 2: 0
; 	Double 1: 1000.000000
; 	Double 2: 0.000000
; Expected outputs:
; 	Integer: 1000
; 	Double: 1000.000000
; Actual outputs:
; 	Integer: 1000
; 	Double: 0.000000
; 
; .text
.align 2
.global _customFunction
_customFunction:
// x0 = int1
// x1 = int2
// d0 = double1
// d1 = double2
// x2 = _outInt
// x3 = _outDouble

stp x29, x30, [sp,#-16]!
mov x29, sp

str w0, [x2]   // store int1 to _outInt
fmov d0, d0    // store double1 to _outDouble

ldp x29, x30, [sp], #16
ret
