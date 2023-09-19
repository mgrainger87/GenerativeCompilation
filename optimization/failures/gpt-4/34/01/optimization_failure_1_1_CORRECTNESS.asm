; solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: -1000
; 	Integer 2: 0
; 	Double 1: 0.000000
; 	Double 2: -1000.000000
; Expected outputs:
; 	Integer: -3000
; 	Double: -250.000000
; Actual outputs:
; 	Integer: -3000
; 	Double: 0.000000
; 
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; Calculate int1 * 3
mov	w8, #3
mul	w8, w0, w8

; Store result in *outInt
str	w8, [x2]

; Load 0.25 into d1 and calculate double2 * 0.25
fmov	d1, #0.25000000
fmul	d0, d1, d0

; Store result in *outDouble
str	d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
