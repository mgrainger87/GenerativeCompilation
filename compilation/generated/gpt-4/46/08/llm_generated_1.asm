//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _helperFunction
.align  2
_helperFunction:
mul w0, w0, w1
ret

.globl  _customFunction
.align  2
_customFunction:
stp x30, xzr, [sp, #-16]!
bl _helperFunction
str w0, [x2]
str d1, [x3]
ldp x30, xzr, [sp], #16
ret
