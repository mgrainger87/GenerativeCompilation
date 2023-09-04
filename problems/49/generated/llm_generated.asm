	.globl	_customFunction
	.p2align	2
_customFunction:
	// Save callee-saved registers if needed. For this function, none are needed.

	// Perform the integer addition for *outInt = int1 + int1;
	add	w4, w0, w0          // w4 = int1 + int1
	str	w4, [x2]            // Store result at address in x2 (outInt)

	// Perform the floating-point addition for *outDouble = double1 + double1;
	fadd	d4, d0, d0          // d4 = double1 + double1
	str	d4, [x3]            // Store result at address in x3 (outDouble)

	// Restore callee-saved registers if needed. For this function, none are needed.
	ret
