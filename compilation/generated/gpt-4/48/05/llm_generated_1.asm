//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// negate the integer in x0 and return
neg w0, w0
ret
.global _customFunction
_customFunction:
// save link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// call helperFunction with int2 as the parameter
mov w0, w1
bl _helperFunction

// store the result of helperFunction in *outInt
str w0, [x2]

// store double1 in *outDouble
fmov d0, d0
str d0, [x3]

// restore link register and return
ldp x30, x29, [sp], #16
ret
