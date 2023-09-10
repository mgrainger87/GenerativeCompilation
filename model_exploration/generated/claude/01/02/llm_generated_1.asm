//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
// Function: customFunction
// Registers:
// x0 - int int1
// x1 - int int2

// d0 - double double1
// d1 - double double2
// x2 - int* _outInt
// x3 - double* _outDouble
.global _customFunction // mangled name
.p2align 2 // align symbol
_customFunction:
// save callee-saved regs
stp x19, x20, [sp,#-16]!
stp x21, x22, [sp,#-16]!
stp x23, x24, [sp,#-16]!
stp x25, x26, [sp,#-16]!
stp x27, x28, [sp,#-16]!
stp fp, lr, [sp,#-16]!
// function body
str w0, [x2] // *_outInt = int1
str d0, [x3] // *_outDouble = double1
// restore callee-saved regs
ldp fp, lr, [sp],#16
ldp x27, x28, [sp],#16

ldp x25, x26, [sp],#16
ldp x23, x24, [sp],#16
ldp x21, x22, [sp],#16
ldp x19, x20, [sp],#16
ret // return
