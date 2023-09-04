	.section	__DATA,__data
	.p2align	3
const_1_1:	.double	1.1
const_0_1:	.double	0.1

	.text
	.globl _customFunction
	.p2align	3
_customFunction:
	// Load 1.1 into d2 from the data section
	adrp	x4, const_1_1@PAGE   // Get the page address of const_1_1 into x4
	ldr	d2, [x4, const_1_1@PAGEOFF] // Load the actual value from the offset

	// Add double1 and 1.1: d2 = d0 + d2
	fadd	d2, d0, d2

	// Load 0.1 into d3 from the data section
	adrp	x5, const_0_1@PAGE   // Get the page address of const_0_1 into x5
	ldr	d3, [x5, const_0_1@PAGEOFF] // Load the actual value from the offset

	// Compute the value of temp + double2 - 0.1
	fadd	d4, d2, d1          // Add temp and double2: d4 = d2 + d1
	fsub	d4, d4, d3          // Subtract 0.1 from the result: d4 = d4 - d3

	// Store the result in *outDouble
	str	d4, [x3]

	ret
