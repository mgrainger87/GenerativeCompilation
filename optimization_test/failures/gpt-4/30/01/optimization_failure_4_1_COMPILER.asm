; solution_number=4,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpmxahld1_.asm:13:14: error: invalid operand for instruction
; fmla d0, d0, d0, #1 ; d0 = d0 + d0 * 1, which multiplies the value by 2
;              ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; For *outInt = (int1 * 6) * 0.5;
add	w0, w0, w0, LSL #1	; w0 = w0 + (w0 << 1) which is effectively multiplying by 3
str	w0, [x2]	; Store the result to *outInt

; For *outDouble = (double1 * 8) * 0.25;
fmla	d0, d0, d0, #1	; d0 = d0 + d0 * 1, which multiplies the value by 2
str	d0, [x3]	; Store the result to *outDouble

ret
.cfi_endproc
