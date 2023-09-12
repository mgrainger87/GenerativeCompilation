; compiler_errors=2,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpiuwrsxkq.asm:13:9: error: invalid operand for instruction
; mov d0, d2
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpiuwrsxkq.asm:14:9: error: invalid operand for instruction
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
sub	sp, sp, #16
stp	x29, x30, [sp, #8]
add	x29, sp, #8
mov	w8, w0
mov	w9, w1
mov	d0, d2
mov	d1, d3
ldr	x2, [sp, #24]
mov	w0, 1000
str	w0, [x2]
ldp	x29, x30, [sp, #8]
add	sp, sp, #16
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
