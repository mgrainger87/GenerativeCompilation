//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!
mov x29, sp

mov w4, #1
str w4, [x2]

mov w5, #1
1:
cmp w5, w0
bgt 2f

ldr w4, [x2]
mul w4, w4, w5
str w4, [x2]

add w5, w5, #1
b 1b

fmov d4, #0.0
str d4, [x3]

2:
ldp x29, x30, [sp], #16
ret
