; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpogy1t_lo.asm:20:1: error: unknown directive
; .subsections_
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
;
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #32
.cfi_def_cfa_offset 32
stp	w0, w1, [sp]
stp	d0, d1, [sp, #16]
mov	w8, w0
str	w8, [x2]
ldr	d0, [sp, #16]
str	d0, [x3]
add	sp, sp, #32
ret
.cfi_endproc
; -- End function
.subsections_
