; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=4
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplw56oij5.asm:19:10: error: expected compatible register or floating-point constant
; fmov d0, [x9]
;          ^
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
fmov	d0, [x9]
add	sp, sp, #48
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
