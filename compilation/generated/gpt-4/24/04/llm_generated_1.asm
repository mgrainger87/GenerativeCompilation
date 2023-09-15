//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
stp x29, x30, [sp, #-16]!
mov x29, sp
fmov d1, #0.0               ; Corrected this line to set floating point register to 0
str d1, [x3]
mov w4, wzr
1:
cmp w4, w0
b.ge 2f
ldr d1, [x3]
fadd d1, d1, d0
str d1, [x3]
add w4, w4, #1
b 1b
2:
mov w4, wzr
str w4, [x2]
ldp x29, x30, [sp], #16
ret
