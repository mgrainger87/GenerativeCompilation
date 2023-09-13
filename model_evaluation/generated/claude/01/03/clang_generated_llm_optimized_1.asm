//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section __TEXT,__text,regular,pure_instructions
.globl _customFunction
.p2align 2
_customFunction:

// x0 = int1, x1 = int2, x2 = outInt, x3 = outDouble
// d0 = double1, d1 = double2

stp x29, x30, [sp,#-16]!
add x29, sp, #0

str w0, [x2]       // store int1 to *outInt
str d0, [x3]       // store double1 to *outDouble

ldp x29, x30, [sp],#16
ret
