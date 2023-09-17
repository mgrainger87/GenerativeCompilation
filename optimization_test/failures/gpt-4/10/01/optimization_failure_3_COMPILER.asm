; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpockvp9_l.asm:9:17: error: expected 'sxtx' 'uxtx' or 'lsl' with optional integer in range [0, 4]
; add w8, w0, w1, sxtw #6
;                 ^
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

; Calculate (int1 + int2) + (-6)
add	w8, w0, w1, sxtw #6

; Store the result to *outInt
str	w8, [x2]

; Return
ret
.cfi_endproc
.subsections_via_symbols
