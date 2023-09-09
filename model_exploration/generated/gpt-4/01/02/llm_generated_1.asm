//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2

_customFunction:
// *outInt = int1; is equivalent to storing x0 (int1) to the address in x2 (outInt)
str w0, [x2]

// *outDouble = double1; is equivalent to storing d0 (double1) to the address in x3 (outDouble)
str d0, [x3]

ret
