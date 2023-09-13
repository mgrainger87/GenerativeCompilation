//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
str w0, [x2]      // Store the value in register w0 (int1) to the address in register x2 (outInt)
str d0, [x3]      // Store the value in register d0 (double1) to the address in register x3 (outDouble)
ret               // Return from the function
