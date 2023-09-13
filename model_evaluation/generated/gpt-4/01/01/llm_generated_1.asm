//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store int1 to the address in outInt
str w0, [x2]

// Store double1 to the address in outDouble
str d0, [x3]

// Return
ret
