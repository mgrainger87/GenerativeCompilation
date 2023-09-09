.global	_customFunction
.align	2

_customFunction:
// Check if double2 (d1) is 0.0
fcmp	d1, #0.0
bne	1f // If double2 is not 0.0, skip to the next section

// Store double1 into *outDouble
str	d0, [x3]
ret

1:	// Load 1.0 into x4 and x5, then move it to d4
ldr	x4, =0x3FF0000000000000
orr	x5, xzr, x4
fmov	d4, x5

// Decrement double1 and double2 by 1.0
fsub	d0, d0, d4
fsub	d1, d1, d4

// Save the caller-saved registers
stp	x0, x1, [sp, #-16]!
stp	x2, x3, [sp, #-16]!
stp	d0, d1, [sp, #-16]!

// Make the recursive function call
bl	_customFunction

// Restore the caller-saved registers
ldp	d0, d1, [sp], #16
ldp	x2, x3, [sp], #16
ldp	x0, x1, [sp], #16

ret
