.global _customFunction
_customFunction:
	// Alignment
	.align 3

	// int a = int1 * 6;
	mov x4, #6          // Load constant 6 into x4
	mul x4, x4, x0      // Multiply x0 (int1) with 6 and store result in x4

	// int b = a;
	// This step is essentially redundant, as 'b' is just a copy of 'a'
	// So, x4 already has the value of b

	// *outInt = b;
	str x4, [x2]        // Store x4 (b) to the address in x2 (outInt)

	// double x = double1 * 1.5;
	fmov d4, #1.5       // Load constant 1.5 into d4
	fmul d4, d4, d0     // Multiply d0 (double1) with 1.5 and store result in d4

	// double y = x;
	// This step is redundant, as 'y' is just a copy of 'x'
	// So, d4 already has the value of y

	// *outDouble = y;
	str d4, [x3]        // Store d4 (y) to the address in x3 (outDouble)

	ret                 // Return from the function
