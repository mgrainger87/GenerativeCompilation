//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
.align	3
_helperFunction:
// a is passed in x0
mul	x0, x0, x0	// Multiply a by itself
ret		// Return with result in x0

.global _customFunction
.align	3
_customFunction:
// Save link register to stack
stp	x30, x29, [sp, #-16]!
mov	x29, sp

// Call helperFunction
bl	_helperFunction
str	w0, [x2]	// Store result to *outInt

// Subtract double2 from double1
fsub	d0, d0, d1
str	d0, [x3]	// Store result to *outDouble

// Restore link register and return
ldp	x30, x29, [sp], #16
ret
