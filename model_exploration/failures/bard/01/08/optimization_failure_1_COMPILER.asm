; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp95d5lkz1-a3fe5d.s:5:1: error: this directive must appear between .cfi_startproc and .cfi_endproc directives
; .cfi_def_cfa_offset 48
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp95d5lkz1.asm:7:10: error: expected compatible register or floating-point constant
; fmov d0, [x9]
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; sub	sp, sp, #48
.cfi_def_cfa_offset 48
str	w0, [sp, #44]
str	d0, [sp, #32]
ldr	w8, [sp, #44]
ldr	x9, [sp, #16]
fmov	d0, [x9]
add	sp, sp, #48
ret
