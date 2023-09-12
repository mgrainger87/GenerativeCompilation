; compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=2
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
; 	Integer: 0
; 	Double: 0.000000
; 
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #48
.cfi_def_cfa_offset 16
str	w0, [sp, #44]
str	w1, [sp, #40]
str	d0, [sp, #32]
str	d1, [sp, #24]
str	x2, [sp, #16]
str	x3, [sp, #8]
ldr	w8, [sp, #44]
ldr	x9, [sp, #16]
ldr	d0, [sp, #32]
str	d0, [x9]
add	sp, sp, #48
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
