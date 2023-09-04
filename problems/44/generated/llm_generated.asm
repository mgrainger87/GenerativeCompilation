	.global _customFunction
	.align	2

_customFunction:
	// Entry point

	// *outInt = int1 * int1;
	mul	w4, w0, w0		// w4 = x0 * x0
	str	w4, [x2]		// Store w4 to the address in x2

	// *outDouble = double2 * double2;
	fmul	d4, d1, d1		// d4 = d1 * d1
	str	d4, [x3]		// Store d4 to the address in x3

	// Return
	ret
