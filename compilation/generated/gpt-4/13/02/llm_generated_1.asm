//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Compare int1 and int2
cmp w0, w1

// If they are not equal, set *outInt to 0 and *outDouble to 0.0
b.ne .1_not_equal

// Calculate int1 * int2
mul w4, w0, w1

// Store the product to *outInt
str w4, [x2]

// Calculate double1 + double2
fadd d2, d0, d1

// Store the result to *outDouble
str d2, [x3]

// Return
ret

.1_not_equal:
// Set *outInt to 0
mov w4, #0
str w4, [x2]

// Set *outDouble to 0.0
fmov d2, #0.0
str d2, [x3]

// Return
ret
