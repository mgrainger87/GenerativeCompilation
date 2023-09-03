	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc

; Integer calculation
	mov	w8, #8                      ; Load the immediate value 8 into w8
	mul	w8, w0, w8                  ; Multiply int1 (w0) by 8 and store the result in w8
	str	w8, [x2]                    ; Store the result in the memory location pointed to by outInt (x2)

; Floating-point calculation
	fmov	d1, #16.00000000            ; Load the immediate value 16.0 into d1
	fmul	d0, d0, d1                  ; Multiply double1 (d0) by 16.0 and store the result back in d0
	str	d0, [x3]                    ; Store the result in the memory location pointed to by outDouble (x3)

	ret
	.cfi_endproc
