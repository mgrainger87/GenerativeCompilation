.section	__TEXT,__text,regular,pure_instructions
	.align	2
	.globl	_customFunction
	.p2align	2
_customFunction:                              ; @customFunction
	.cfi_startproc
                                        ; %bb.0:
	ldrsw	x2, [sp, #8]	; Load int1 from the stack
	ldrsw	x3, [sp, #12]	; Load int2 from the stack
	umlal	v0.2d, v2.2s, v3.s[0]	; Multiply int2 by 0 and add int1, result in v0
	fmul	d0, d0, d1	; Multiply v0 by 2.0, result in d0
	str	w0, [sp, #16]	; Store the integer result in outInt
	ldr	d1, [sp, #24]	; Load double1 from the stack
	ldr	d2, [sp, #32]	; Load double2 from the stack
	fmsub	d3, d2, d1, d1	; Multiply double2 by 0.0, subtract from double1, result in d3
	fmul	d3, d3, d4	; Multiply d3 by 2.0, result in d3
	str	d3, [sp, #40]	; Store the double result in outDouble
	ret
	.cfi_endproc
                                        ; End of function _customFunction
