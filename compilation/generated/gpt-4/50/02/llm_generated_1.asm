//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 4

_helperFunction:
add x0, x0, #10
ret

.align 4
_customFunction:
stp x30, x19, [sp, #-16]!

bl _helperFunction

str w0, [x2]
str d1, [x3]

ldp x30, x19, [sp], #16
ret
