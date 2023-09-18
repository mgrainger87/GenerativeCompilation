; solution_number=3,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: -1000
; 	Integer 2: 0
; 	Double 1: -1000.000000
; 	Double 2: 0.000000
; Expected outputs:
; 	Integer: -3000
; 	Double: -2000.000000
; Actual outputs:
; 	Integer: 1073736824
; 	Double: -2000.000000
; 
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; For *outInt = (int1 * 6) * 0.5;
add	w0, w0, w0	; Double int1
add	w0, w0, w0	; Double int1 again (effectively multiplying by 4)
add	w0, w0, w0, LSR #2	; Add int1/4 to the result (effectively multiplying by 5)
str	w0, [x2]	; Store the result to *outInt

; For *outDouble = (double1 * 8) * 0.25;
fmov	d1, #2.00000000	; Load 2 into d1
fmul	d0, d0, d1	; Multiply double1 by 2 directly in d0
str	d0, [x3]	; Store the result to *outDouble

ret
.cfi_endproc
