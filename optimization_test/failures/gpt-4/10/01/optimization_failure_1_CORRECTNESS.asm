; compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: -1000
; 	Integer 2: -1000
; 	Double 1: 0.000000
; 	Double 2: 0.000000
; Expected outputs:
; 	Integer: -2006
; 	Double: 0.000000
; Actual outputs:
; 	Integer: -3006
; 	Double: 0.000000
; 
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Calculate int1 + int2 - 6
add	w8, w0, w1, LSL #1
sub	w8, w8, #6

; Store the result to *outInt
str	w8, [x2]

; Return
ret
.cfi_endproc
.subsections_via_symbols
