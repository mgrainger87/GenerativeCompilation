//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Compare int1 and int2
cmp w0, w1

// If they're not equal, jump to not_equal label
b.ne 1f

// If they're equal:
// Multiply int1 and int2
mul w4, w0, w1
// Store the result in *outInt
str w4, [x2]

// Add double1 and double2
fadd d4, d0, d1
// Store the result in *outDouble
str d4, [x3]
ret

1:  // not_equal label:
// Store 0 in *outInt
mov w4, #0
str w4, [x2]

// Load 0.0 into d4
fmov d4, #0.0
// Store 0.0 in *outDouble
str d4, [x3]
ret
