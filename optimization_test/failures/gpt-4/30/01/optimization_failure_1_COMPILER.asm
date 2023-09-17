; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpfbtjpd59.asm:14:14: error: invalid operand for instruction
; fmul d0, d0, d_const_2
;              ^
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

; Calculate double1 * 2 using constant pool
fmul	d0, d0, d_const_2
str	d0, [x3]

ret
.cfi_endproc

.p2align	2
d_const_2:
.double	2.00000000
