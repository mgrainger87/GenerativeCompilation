//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
; store int1 value directly to *outInt
str	w0, [x2]

; store double1 value directly to *outDouble
str	d0, [x3]

ret
.cfi_endproc
