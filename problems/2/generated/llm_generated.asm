	.section	__TEXT,__text,regular,pure_instructions
	.globl	_customFunction
	.align	3
_customFunction:
	// Preserve lr 
	stp		x30, xzr, [sp, #-16]!
	
	// *outInt = int1 / 1; (since dividing by 1 is essentially a no-op, we can just move the value)
	str		x0, [x2]

	// *outDouble = double1 / 1.0; (same logic here, just move the value)
	str		d0, [x3]
	
	// Restore lr
	ldp		x30, xzr, [sp], #16
	
	ret
