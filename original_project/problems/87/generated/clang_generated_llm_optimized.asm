	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc

    ; Multiply int1 by 3 and store result to *outInt
    mov	w8, #3
    mul	w8, w0, w8
    str	w8, [x2]

    ; Multiply double2 by 0.25 and store result to *outDouble
    fmov	d2, #0.25000000
    fmul	d2, d1, d2
    str	d2, [x3]

    ; Return from function
	ret

	.cfi_endproc
