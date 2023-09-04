	.global _customFunction
	.align	3
_customFunction:
	// Prologue: save frame pointer and stack pointer if needed
	stp	x29, x30, [sp, #-16]!  // Store frame pointer and return address
	mov	x29, sp              // Set frame pointer to current stack pointer

	// Initialize loop counter i
	mov	w4, #0               // w4 will be used as our loop counter 'i'

1:	// Loop start label
	cmp	w4, #2               // Compare i with 2
	b.ge	2f                  // If i >= 2, break out of the loop

	// Main loop content
	fsub	d5, d0, d1          // d5 = double1 - double2
	str	d5, [x3]            // Store the result in *outDouble

	// Increment loop counter and loop back
	add	w4, w4, #1          // Increment 'i'
	b	1b                  // Jump back to loop start

2:	// Loop end label
	// Epilogue: restore frame pointer and return
	ldp	x29, x30, [sp], #16  // Restore frame pointer and return address
	ret                     // Return from function
