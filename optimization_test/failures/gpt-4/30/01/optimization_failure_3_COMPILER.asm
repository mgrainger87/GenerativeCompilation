; compiler_errors=2,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptsauha_q-44c9c8.s:17:1: error: ADR/ADRP relocations must be GOT relative
; adrp x9, d_const_2
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptsauha_q-44c9c8.s:17:1: error: unknown AArch64 fixup kind!
; adrp x9, d_const_2
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptsauha_q-44c9c8.s:18:1: error: unknown AArch64 fixup kind!
; ldr d1, [x9, #:lo12:d_const_2] ; Load 2.0 from constant pool into d1
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

; Calculate int1 * 3
lsl	w8, w0, #1     ; w8 = int1 * 2
add	w8, w8, w0    ; w8 = w8 + int1 = int1 * 3
str	w8, [x2]

; Load address of d_const_2 into x9
adrp	x9, d_const_2
ldr	d1, [x9, #:lo12:d_const_2] ; Load 2.0 from constant pool into d1

; Calculate double1 * 2 using constant from d1
fmul	d0, d0, d1
str	d0, [x3]

ret
.cfi_endproc

.p2align	2
d_const_2:
.double	2.00000000
