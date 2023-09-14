//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
sub w0, w0, w1      // w0 = int1 - int2
str w0, [x2]       // *outInt = int1 - int2
fsub d0, d0, d1    // d0 = double1 - double2
str d0, [x3]       // *outDouble = double1 - double2
ret                // return
