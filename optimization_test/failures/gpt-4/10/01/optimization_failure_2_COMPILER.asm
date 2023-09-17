; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmphs0_52fc.asm:9:21: error: unexpected token in argument list
; add w8, w1, w0, sub #6
;                     ^
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

; Calculate int1 - 6 + int2 in a single instruction
add	w8, w1, w0, sub #6

; Store the result to *outInt
str	w8, [x2]

; Return
ret
.cfi_endproc
.subsections_via_symbols
