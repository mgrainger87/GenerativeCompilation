.global _customFunction
.align 3                      // Align to 2^3 = 8 bytes boundary
_customFunction:
	// Entry
	stp x29, x30, [sp, #-16]!   // Save frame pointer and return address to the stack
	mov x29, sp                 // Update frame pointer to the current stack pointer
	
	// *outInt = int1 * 2 + int2 * 3 + 10;
	lsl x6, x0, #1              // x6 = int1 * 2
	lsl x7, x1, #1              // x7 = int2 * 2
	add x7, x7, x1              // x7 = x7 + int2 = int2 * 3
	add x6, x6, x7              // x6 = x6 + x7 = int1 * 2 + int2 * 3
	add x6, x6, #10             // x6 = x6 + 10
	str x6, [x4]                // Store x6 to *outInt

	// *outDouble = double1 + double2 + 5.5;
	fmov d2, #5.5               // Load 5.5 to d2
	fadd d2, d2, d0             // d2 = d2 + double1
	fadd d2, d2, d1             // d2 = d2 + double2
	str d2, [x5]                // Store d2 to *outDouble

	// Exit
	ldp x29, x30, [sp], #16    // Restore frame pointer and return address from the stack
	ret                        // Return