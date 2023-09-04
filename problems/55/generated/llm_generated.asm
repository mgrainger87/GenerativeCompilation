	.globl	_customFunction
	.p2align	2
_customFunction:
	// Calculate (int1 * 4) + int1 + int1
	// First, compute int1 * 6
	lsl	x4, x0, #2         // Multiply int1 by 4
	add	x4, x4, x0, lsl #1  // Add int1 twice more
	
	// Store the result to *outInt
	str	w4, [x2]
	
	// Calculate (double1 * 5) + double1 + double1 + double1
	// First, compute double1 * 8
	fmov	d4, #8.0
	fmul	d4, d4, d0        // Multiply double1 by 8
	
	// Store the result to *outDouble
	str	d4, [x3]
	
	ret
