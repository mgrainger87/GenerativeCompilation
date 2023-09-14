//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to stack
stp x30, xzr, [sp, #-16]!

// Calculate int1 + int2
add w4, w0, w1  // w4 will hold the result of int1 + int2

// Compare the sum to 100
cmp w4, #100

// If sum > 100, branch to the true part of the conditional
b.gt .L1

// Else part:
str w4, [x2]  // Store sum in *outInt

// Calculate double1 + double2
fadd d4, d0, d1
str d4, [x3]  // Store result in *outDouble
b .end

// If part:
.L1:
mov w4, #100
str w4, [x2]  // Store 100 in *outInt

// Calculate double1 * double2
fmul d4, d0, d1
str d4, [x3]  // Store result in *outDouble

.end:
// Restore link register and return
ldp x30, xzr, [sp], #16
ret
