//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global	_customFunction
.align	3
_customFunction:
// Save the link register to preserve the return address
stp	x30, x29, [sp, #-16]!
mov	x29, sp

// *outInt = int1;
str	w0, [x2] // Store the value of int1 (x0) at the address in outInt (x2)

// *outDouble = double2;
str	d1, [x3] // Store the value of double2 (d1) at the address in outDouble (x3)

// Restore the link register and return
ldp	x30, x29, [sp], #16
ret
