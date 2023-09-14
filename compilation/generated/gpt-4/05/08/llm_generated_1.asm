//compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
.global _customFunction
_customFunction:
// *outInt = int2;
str     w1, [x2]

// *outDouble = double1;
str     d0, [x3]

// Return to the caller
ret
