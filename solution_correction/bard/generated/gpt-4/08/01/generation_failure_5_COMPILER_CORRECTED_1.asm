//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// Store the parameters into their respective destination
str w0, [x2]     // *outInt = int1
str d0, [x3]    // *outDouble = double1

// Return
ret
