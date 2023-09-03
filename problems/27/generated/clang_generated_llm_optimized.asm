	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        
	.cfi_startproc
	; Check if int1 (w0) is greater than 5
	subs	w8, w0, #5
	b.le	1f ; Branch to label 1 if int1 is not greater than 5

	; If int1 > 5, store int1 in *outInt (x2)
	str	w0, [x2]
	b	2f ; Jump to end

1:  ; int1 + int2 and store in *outInt
	add	w8, w0, w1
	str	w8, [x2]
	; double1 - double2 and store in *outDouble
	fsub	d8, d0, d1
	str	d8, [x3]

2:  ; End label
	ret
	.cfi_endproc
