//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc

; Save int1 to *outInt directly
str	w0, [x2]

; Save double1 to *outDouble directly
str	d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
