.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
	.cfi_startproc
    sub     w8, w0, w1     ; int1 - int2
    str     w8, [x2]       ; Store the result in *outInt
    ret
	.cfi_endproc
.subsections_via_symbols
