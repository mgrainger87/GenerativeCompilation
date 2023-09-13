//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.p2align 2
_customFunction:
stp x29, x30, [sp,#-16]!
mov x29, sp
// x0 = int1
// x1 = int2
// d0 = double1
// d1 = double2
// x2 = outInt
// x3 = outDouble

str w0, [x2]    // *outInt = int1
str d0, [x3]    // *outDouble = double1

ldp x29, x30, [sp],#16
ret
