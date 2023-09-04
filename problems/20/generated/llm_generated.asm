	.globl	_customFunction
	.align	2
_customFunction:
	// Save callee-saved registers
	stp	x19, x20, [sp, #-16]!
	stp	d8, d9, [sp, #-16]!
	
	// temp1 = int1 + 6 - 3
	add	w19, w0, #3   // Note: Use 'w19' and 'w0' for 32-bit operations
	
	// temp2 = double2 + 1.5 - 0.5
	fmov	d8, #1.0
	fadd	d9, d1, d8
	
	// Extend x19 from 32-bit to 64-bit
	sxtw	x19, w19
	
	// *outDouble = temp1 + temp2
	scvtf	d8, x19
	fadd	d8, d8, d9
	str	d8, [x3]

	// Restore callee-saved registers and return
	ldp	d8, d9, [sp], #16
	ldp	x19, x20, [sp], #16
	ret
