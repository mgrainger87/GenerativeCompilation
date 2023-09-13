//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _customFunction
.align  2
_customFunction:
// *outInt = int1;
str     w0, [x2]

// *outDouble = double1;
str     d0, [x3]

ret
