; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=2
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: 0
; 	Integer 2: 0
; 	Double 1: 0.000000
; 	Double 2: 0.000000
; Expected outputs:
; 	Integer: 6
; 	Double: 2.000000
; Actual outputs:
; 	Integer: 6
; 	Double: 3.000000
; 
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc

; Calculate (int1 + 2) * (int2 + 3)
add	w8, w0, #2 ; w8 = 2
add	w9, w1, #3 ; w9 = 3
mul	w8, w8, w9 ; w8 = 6
str	w8, [x2] ; Store result to outInt

; Calculate (double1 + 1.0) * (double2 + 2.0)
fmov	d1, #1.00000000 ; d1 = 1.0
fadd	d0, d0, d1 ; d0 = 1.0
fmov	d2, #2.00000000 ; d2 = 2.0
fadd	d2, d1, d2 ; d2 = 3.0
fmul	d0, d0, d2 ; d0 = 2.0
str	d0, [x3] ; Store result to outDouble

ret
.cfi_endproc
