//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
str	w0, [x2]  ; Store int1 to *outInt
str	d0, [x3]  ; Store double1 to *outDouble
ret
.cfi_endproc
