//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store int2 into *outInt
str     w1, [x2]

// Store double1 into *outDouble
str     d0, [x3]

// Return
ret
