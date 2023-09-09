	.global _customFunction
	.align	3
_customFunction:
	// The function doesn't call any other function, so we don't need to save the lr register.
	// We also don't modify any callee-saved registers, so no need to save/restore them.

	// *outInt = int1 + 0;
	str	w0, [x2]  // w0 is the 32-bit width of x0

	// *outDouble = double1 * 1.0;
	// Since we can't use direct floating-point literals with fadd, we'll just move double1 to *outDouble.
	fmov	d2, d0
	str	d2, [x3]

	ret
