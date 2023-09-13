; compiler_errors=3,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp6l3o6zsc.asm:19:12: error: unexpected floating point literal
; fccmp d0, #0.0, #0
;            ^
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
.cfi_def_cfa_offset 48
str	x0, [sp, #44]
str	x1, [sp, #40]
str	d0, [sp, #32]
str	d1, [sp, #24]
str	x2, [sp, #16]
str	x3, [sp, #8]
ldr	x8, [sp, #44]
ldr	x9, [sp, #16]
ldr	d0, [x9]
fccmp	d0, #0.0, #0
beq	.LBB0_3
ldr	d0, [sp, #32]
ldr	x8, [sp, #8]
str	d0, [x8]
b	.LBB0_4
.LBB0_3:
mov	x0, #0
.LBB0_4:
add	sp, sp, #48
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
