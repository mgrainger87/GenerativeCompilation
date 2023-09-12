//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Assign int1 to *outInt
str w0, [x2]

// Assign double1 to *outDouble
str d0, [x3]

ret
