//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align	2
_customFunction:
// Save the link register to the stack (since we're not branching to another function, this is technically optional, but adhering strictly to the guidelines)
stp	x30, x29, [sp, #-16]!	// Save x30 (LR) and x29 (FP) to stack and decrement SP by 16
mov	x29, sp			// Set frame pointer (FP) to SP

// Compute int1 - int2 and store in outInt
sub	w4, w0, w1		// w4 = int1 - int2
str	w4, [x2]		// Store w4 to *outInt

// Compute double1 - double2 and store in outDouble
fsub	d4, d0, d1		// d4 = double1 - double2
str	d4, [x3]		// Store d4 to *outDouble

// Restore link register and return
ldp	x30, x29, [sp], #16	// Restore x30 and x29 from stack and increment SP by 16
ret				// Return to caller
