; compiler_errors=4,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp36fp6o65-d72347.s:20:1: error: conditional branch requires assembler-local label. '.LBB0_2' is external.
; bge .LBB0_2
; ^
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
sub	sp, sp, #16
stp	x29, x30, [sp, #8]
add	x29, sp, #8
mov	w8, w0
mov	w9, w1
fmov	d0, d2
fmov	d1, d3
ldr	x10, [sp, #24]
cmp	x10, #99
bge	.LBB0_2
mov	x11, x10
b	.LBB0_3
.LBB0_2:
mov	x11, #0
.LBB0_3:
ldr	x2, [x29, #24]
add	x2, x2, x11
ldr	w0, [x2]
str	w0, [x29, #-4]
bl	_printInt
ldp	x29, x30, [sp, #8]
add	sp, sp, #16
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
