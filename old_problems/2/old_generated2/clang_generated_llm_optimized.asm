	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2

_customFunction:
	.cfi_startproc
	
	; Save callee-saved registers (x19 to x30) and (d8 to d15)
	stp	x19, x20, [sp, #-16]!
	stp	x21, x22, [sp, #-16]!
	stp	x23, x24, [sp, #-16]!
	stp	x25, x26, [sp, #-16]!
	stp	x27, x28, [sp, #-16]!
	stp	x29, x30, [sp, #-16]!
	stp	d8, d9, [sp, #-16]!
	stp	d10, d11, [sp, #-16]!
	stp	d12, d13, [sp, #-16]!
	stp	d14, d15, [sp, #-16]!
	
	; Load 8 (the length of "constant") into w0
	mov	w0, #8
	
	; Store the result in outInt
	str	w0, [x4]
	
	; Assign 0 to outDouble
	fmov	d0, #0.0
	str	d0, [x5]
	
	; Restore callee-saved registers
	ldp	d14, d15, [sp], #16
	ldp	d12, d13, [sp], #16
	ldp	d10, d11, [sp], #16
	ldp	d8, d9, [sp], #16
	ldp	x29, x30, [sp], #16
	ldp	x27, x28, [sp], #16
	ldp	x25, x26, [sp], #16
	ldp	x23, x24, [sp], #16
	ldp	x21, x22, [sp], #16
	ldp	x19, x20, [sp], #16
	
	ret
	.cfi_endproc
