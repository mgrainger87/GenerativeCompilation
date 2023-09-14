//compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!
mov x29, sp
fmov d2, #1.0
str d2, [x3]
mov w5, wzr
1:  cbz w0, 3f
fmul d2, d0, d1
ldr d3, [x3]
fmul d2, d2, d3
str d2, [x3]
add w5, w5, #1
sub w0, w0, #1
b 1b
3:  mov w6, wzr
str w6, [x2]
ldp x29, x30, [sp], #16
ret
