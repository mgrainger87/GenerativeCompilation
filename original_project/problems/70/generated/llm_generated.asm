	.globl	_customFunction
	.p2align	3
_customFunction:
	// Prologue
	stp	x29, x30, [sp, #-16]!	// Save frame pointer and return address.
	mov	x29, sp			// Update frame pointer.

	// Initialize loop counter, i
	mov	w4, #0			// w4 will be our loop counter.

1:	// Loop label

	// Check loop condition
	cmp	w4, #4
	b.ge	2f			// If i >= 4, exit loop.

	// Calculate the sum of int1, int2, double1, and double2
	scvtf	d2, w0			// Convert int1 to double.
	scvtf	d3, w1			// Convert int2 to double.
	fadd	d2, d2, d0		// Add double1.
	fadd	d3, d3, d1		// Add double2.
	fadd	d2, d2, d3		// Add the results.

	// Divide the sum by 4.0
	fmov	d3, #4.0
	fdiv	d2, d2, d3

	// Store the result in *outDouble
	str	d2, [x3]

	// Increment loop counter
	add	w4, w4, #1

	// Jump back to loop start
	b	1b

2:	// Loop exit label

	// Epilogue
	ldp	x29, x30, [sp], #16	// Restore frame pointer and return address.
	ret
