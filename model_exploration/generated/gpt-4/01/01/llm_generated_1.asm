//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align	2

_customFunction:
// The function does not need to maintain any callee-saved registers
// since it doesn't use any of them.

// *outInt = int1;
str w0, [x2]          // Store int1 (w0) into the address pointed to by outInt (x2)

// *outDouble = double1;
str d0, [x3]          // Store double1 (d0) into the address pointed to by outDouble (x3)

ret                   // Return from function
