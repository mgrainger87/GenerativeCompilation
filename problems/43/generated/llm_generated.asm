	.global _customFunction
	.p2align	2

_customFunction:
	// Multiply int1 (x0) by 3
	add 	w4, w0, w0		// w4 = int1 * 2
	add 	w4, w4, w0		// w4 = int1 * 3

	// Store the result into *outInt (x2)
	str	w4, [x2]

	// Multiply double1 (d0) by 4
	fadd	d5, d0, d0		// d5 = double1 * 2
	fadd	d5, d5, d0		// d5 = double1 * 3
	fadd	d5, d5, d0		// d5 = double1 * 4

	// Store the result into *outDouble (x3)
	str	d5, [x3]

	// Return
	ret
