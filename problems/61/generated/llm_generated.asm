	.globl	_customFunction
	.p2align	2
_customFunction:
	// Entry of the function
	// Saving callee-saved registers
	stp	x19, x20, [sp, #-16]!
	stp	x29, x30, [sp, #-16]!
	add	x29, sp, #0

	// Initialize sum
	mov	x4, #0	// x4 will hold the value of 'sum'

	// For loop
	mov	x5, #4	// x5 will hold the loop counter
1:
	subs	x5, x5, #1	// Decrement loop counter
	add	x4, x4, x0	// sum += int1;
	b.ne	1b	// If loop counter is not zero, loop back

	// Store result in *outInt
	str	x4, [x2]

	// Calculate result for *outDouble
	fadd	d0, d0, d1	// d0 = double1 + double2
	str	d0, [x3]	// Store the result in *outDouble

	// Restore callee-saved registers and return
	ldp	x29, x30, [sp], #16
	ldp	x19, x20, [sp], #16
	ret
