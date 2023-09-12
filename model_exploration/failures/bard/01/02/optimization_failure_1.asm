; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp1avg9wza.asm:10:7: error: invalid operand for instruction
; ldrsw w8, [sp, #44]
;       ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp1avg9wza.asm:13:10: error: expected compatible register or floating-point constant
; fmov d0, [sp, #32]
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
.cfi_def_cfa_offset 48
ldrsw	w8, [sp, #44]
ldr	x9, [sp, #16]
str	w8, [x9]
fmov	d0, [sp, #32]
ldr	x8, [sp, #8]
str	d0, [x8]
add	sp, sp, #48
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
