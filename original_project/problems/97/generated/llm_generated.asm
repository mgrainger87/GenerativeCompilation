	.global _customFunction
	.align	2
_customFunction:
	// Prologue (preparing stack for local variables and saving callee-saved registers)
	stp	x29, x30, [sp, -16]!	// Save frame pointer and return address
	mov	x29, sp			// Set up frame pointer for this frame

	// int temp = int1 + 12;
	add	w4, w0, #12

	// int a = temp;
	mov	w5, w4

	// int b = a;
	mov	w6, w5

	// *outInt = b;
	str	w6, [x2]

	// Load 1.7 constant into d1
	adrp	x7, .Ldouble_constant@PAGE
	ldr	d1, [x7, .Ldouble_constant@PAGEOFF]

	// double tempD = double1 * 1.7;
	fmul	d2, d0, d1

	// double x = tempD;
	fmov	d3, d2

	// double y = x;
	fmov	d4, d3

	// *outDouble = y;
	str	d4, [x3]

	// Epilogue (restore stack and return)
	ldp	x29, x30, [sp], #16
	ret

	// Data for the 1.7 constant
	.align	3
.Ldouble_constant:
	.double	1.7
