//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.globl    _customFunction
.align    2
_customFunction:
// *outInt = (int1 + 10 - 5) * (int2 + 5 - 2);

// Compute int1 + 10 - 5 into x4
add    x4, x0, #5

// Compute int2 + 5 - 2 into x5
add    x5, x1, #3

// Multiply x4 and x5, and store the result into x6
mul    x6, x4, x5

// Store the result in *outInt
str    w6, [x2]

ret
