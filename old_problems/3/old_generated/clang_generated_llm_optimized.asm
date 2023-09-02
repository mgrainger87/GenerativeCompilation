	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc
	mov	w0, #0
	add	w0, w0, #5
	str	w0, [x4]
	
	fadd	d0, d0, d1      ; d0 = d0 + d1
	str	d0, [x5]
	ret
	.cfi_endproc
