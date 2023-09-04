	.globl	_customFunction               // Expose function globally
	.align	2
_customFunction:
	// Prologue
	stp	x29, x30, [sp, #-16]!         // Save frame pointer and return address
	mov	x29, sp                      // Set up frame pointer

	// Initialize sum to 0
	mov	w4, #0                       

	// Add int2 to sum twice
	add	w4, w4, w1
	add	w4, w4, w1

	// Add int1 to sum
	add	w4, w4, w0

	// Store sum + int1 to *outInt
	str	w4, [x2]

	// Store double1 to *outDouble
	str	d0, [x3]

	// Epilogue
	ldp	x29, x30, [sp], #16          // Restore frame pointer and return address
	ret
