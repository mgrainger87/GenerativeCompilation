//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save callee-saved registers
stp	x29, x30, [sp, #-16]!
mov	x29, sp

// Check if int1 (x0) is even
and	w4, w0, #1		// w4 = int1 % 2
cbnz	w4, .Lodd

// If even
mov	w4, w0
lsr	w4, w4, #1		// w4 = int1 / 2
str	w4, [x2]		// *outInt = w4

fmov	d4, #2.0		// Load 2.0 into d4
fmul	d4, d0, d4		// d4 = double1 * 2.0
str	d4, [x3]		// *outDouble = d4

b	.Lend

.Lodd:
// If odd
str	w0, [x2]		// *outInt = int1
str	d0, [x3]		// *outDouble = double1

.Lend:
// Restore callee-saved registers and return
ldp	x29, x30, [sp], #16
ret
