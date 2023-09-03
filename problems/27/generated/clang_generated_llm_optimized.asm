	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; Compare int1 with 5
	subs	w8, w0, #5
	b.le	1f                           ; If int1 <= 5, jump to the code for int1 + int2

; Code for int1 > 5
	str	w0, [x2]
	ret

1:                                   ; Code for int1 <= 5
	add	w8, w0, w1
	str	w8, [x2]
	fsub	d0, d0, d1
	str	d0, [x3]
	ret
	.cfi_endproc
.subsections_via_symbols
