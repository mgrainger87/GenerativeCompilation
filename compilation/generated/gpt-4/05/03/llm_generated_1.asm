//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store int2 (in w1) to *outInt (address in x2)
str w1, [x2]

// Store double1 (in d0) to *outDouble (address in x3)
str d0, [x3]

// Return from function
ret
