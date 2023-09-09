//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.p2align 2
_customFunction:
stp x29, x30, [sp,#-16]!
stp x19, x20, [sp,#-16]!
stp x21, x22, [sp,#-16]!
stp x23, x24, [sp,#-16]!
stp x25, x26, [sp,#-16]!
stp x27, x28, [sp,#-16]!
str w0, [x2]
ldp x27, x28, [sp],#16
ldp x25, x26, [sp],#16

ldp x23, x24, [sp],#16
ldp x21, x22, [sp],#16
ldp x19, x20, [sp],#16
ldp x29, x30, [sp],#16
ret
