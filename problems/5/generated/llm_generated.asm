	.section    __TEXT,__text,regular,pure_instructions
	.globl    _power
	.align    2
_power:
	// Prologue
	stp     x29, x30, [sp, #-16]!    // Save frame pointer and link register to the stack
	mov     x29, sp                  // Update frame pointer

	// Initialize result = 1
	mov     w8, #1

	// Check if exp <= 0. If yes, skip loop
	cbz     w1, .Lreturn_power

.Lloop_power:
	// result *= base
	mul     w8, w8, w0               // w8 = w8 * w0

	// i++
	sub     w1, w1, #1               // decrement exp

	// Check if i < exp
	cbnz    w1, .Lloop_power

.Lreturn_power:
	// Return result
	mov     w0, w8

	// Epilogue
	ldp     x29, x30, [sp], #16     // Restore frame pointer and link register from the stack
	ret

	.globl    _customFunction
	.align    2
_customFunction:
	// Prologue
	stp     x29, x30, [sp, #-16]!    // Save frame pointer and link register to the stack
	mov     x29, sp                  // Update frame pointer

	// *outInt = power(int1, 1)
	mov     w1, #1                   // Set exponent to 1
	bl      _power                   // Call power function
	str     w0, [x2]                 // Store result at outInt

	// *outDouble = power(double1, 0)
	// Here, we know power with 0 exponent will always return 1. 
	// Hence, we can directly set the value.
	mov     w8, #1
	scvtf   d8, w8                   // Convert the integer value in w8 to a double value in d8
	str     d8, [x3]                 // Store the double value at outDouble

	// Epilogue
	ldp     x29, x30, [sp], #16      // Restore frame pointer and link register from the stack
	ret
