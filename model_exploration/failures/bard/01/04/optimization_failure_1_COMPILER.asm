; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0fg2876t.asm:10:9: error: invalid operand for instruction
; mov d0, d2
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0fg2876t.asm:11:9: error: invalid operand for instruction
; mov d1, d3
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
mov	w8, w0
mov	w9, w1
mov	d0, d2
mov	d1, d3
mov	x2, x4
mov	x3, x5
str	w8, [x2]
str	d0, [x3]
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
