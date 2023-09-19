//solution_number=3,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; int1 * 0 is always 0
str	wzr, [x2]                      ; Store 0 to the location pointed by outInt using the zero register

; Zero out d0
fmov    d0, xzr
; Store 0.0
str	d0, [x3]                      ; Store 0.0 to the location pointed by outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
