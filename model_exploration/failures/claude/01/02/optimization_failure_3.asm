.section __TEXT,__text,regular,pure_instructions
.globl _customFunction
.p2align 2
_customFunction:

// x0 = int1, x1 = int2, x2 = outInt, x3 = outDouble
// x8 = double1, x9 = double2

stp x29, x30, [sp, #-16]!
mov x29, sp

str w0, [x29, #8]   // save int1
str w1, [x29, #4]   // save int2

str x2, [x29, #0]   // save outInt pointer
str x3, [x29, #-8]  // save outDouble pointer

ldr w0, [x29, #8]
str w0, [x2]       // store int1 to outInt

ldr d0, [x29, #-8]
str d0, [x3]       // store double1 to outDouble

ldp x29, x30, [sp], #16
ret

.cfi_endproc
