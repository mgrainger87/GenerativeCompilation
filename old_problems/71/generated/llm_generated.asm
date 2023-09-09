.global _customFunction
.align 3
_customFunction:
	// Prologue: Save frame pointer and stack pointer
	stp x29, x30, [sp, #-16]!  // Save x29 (frame pointer) and x30 (link register) to stack
	mov x29, sp                // Set frame pointer to current stack pointer

	// Initialize loop counter i in x4
	mov w4, wzr                // Set w4 to 0 (wzr is zero register for 32-bit)

1:  // Loop start label
	// Compare loop counter i with 2
	cmp w4, #2
	b.ge 2f                    // If i >= 2, branch to loop end label

	// Inside loop body: *outInt = int1;
	str w0, [x2]               // Store w0 (int1) to memory pointed by x2 (outInt)

	// Increment loop counter i
	add w4, w4, #1             // Increment w4 by 1

	// Jump to start of loop
	b 1b

2:  // Loop end label

	// Epilogue: Restore frame pointer and stack pointer
	ldp x29, x30, [sp], #16    // Load x29 and x30 from stack and adjust stack pointer
	ret
