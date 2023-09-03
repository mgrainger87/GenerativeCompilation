	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc

; Calculate int1^4 and store it in *outInt
	mul	w8, w0, w0           ; w8 = int1^2
	mul	w8, w8, w8           ; w8 = int1^4
	str	w8, [x2]

; Calculate double1^4 and store it in *outDouble
	fmul	d8, d0, d0          ; d8 = double1^2
	fmul	d8, d8, d8          ; d8 = double1^4
	str	d8, [x3]

	ret
	.cfi_endproc
