.section __TEXT,__text,regular,pure_instructions
.globl _customFunction
.p2align 2
_customFunction:
.cfi_startproc

stp x29, x30, [sp, #-12]!
mov x29, sp

str w0, [x29, #8]
str w1, [x29, #4]

str x2, [x29, #0]
str x3, [x29, #-8]

ldr w0, [x29, #8]
str w0, [x2]

ldr d0, [x29, #-8]
str d0, [x3]

ldp x29, x30, [sp], #12
ret

.cfi_endproc
