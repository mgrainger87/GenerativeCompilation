	.section    __TEXT,__text,regular,pure_instructions
	.align    2
	.globl _customFunction

_customFunction:
	// Save callee-saved registers
	stp x19, x20, [sp, #-16]!  // Push onto the stack, adjusting SP
	stp d8, d9, [sp, #-16]!   // Push onto the stack for FP callee-saved registers

	// int a = int2 * 4;
	lsl x4, x1, #2  // x4 = x1 * 4

	// int b = a;
	mov x5, x4      // x5 = x4

	// *outInt = b;
	str w5, [x2]    // Store the word (32-bit) value of x5 into address pointed by x2

	// Load 1.0 into d6
	fmov d6, #1.0

	// Load 0.25 into d7
	fmov d7, #0.25

	// Subtract d7 from d6 to get 0.75 in d6
	fsub d6, d6, d7

	// Multiply double2 (d1) by 0.75 (d6)
	fmul d8, d1, d6

	// *outDouble = y;
	str d8, [x3]  // Store the double value of d8 into address pointed by x3

	// Restore callee-saved registers and return
	ldp d8, d9, [sp], #16
	ldp x19, x20, [sp], #16
	ret
