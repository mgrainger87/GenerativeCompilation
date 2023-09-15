//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
neg w0, w0
ret

.global _customFunction
_customFunction:
stp x30, xzr, [sp, #-16]!
mov w0, w1
bl _helperFunction
str w0, [x2]
str d0, [x3]
ldp x30, xzr, [sp], #16
ret
