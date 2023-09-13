//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3

_customFunction:
// Store the values of int1 and double1 to *outInt and *outDouble respectively.

// Store int1 (x0) into *outInt (x2)
str w0, [x2]      // "w" since int is 32-bits on LP64

// Store double1 (d0) into *outDouble (x3)
str d0, [x3]      // store floating-point value using the correct instruction

// Return from function
ret
