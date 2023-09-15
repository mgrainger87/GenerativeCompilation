//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2

_customFunction:
// Compare the two double values
fcmp d0, d1

// If double1 > double2, branch to then_block
b.gt then_block

else_block:
// Calculate int1 - int2
sub w4, w0, w1

// Store result to *outInt
str w4, [x2]

// Store double2 to *outDouble
str d1, [x3]

// End of function
ret

then_block:
// Calculate int1 + int2
add w4, w0, w1

// Store result to *outInt
str w4, [x2]

// Store double1 to *outDouble
str d0, [x3]

// End of function
ret
