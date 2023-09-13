//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
stp x29, x30, [sp, -16]!  ; save frame pointer and link register
mov x29, sp               ; set frame pointer to current stack pointer

str w0, [x2]              ; *outInt = int1
fmov d1, d0               ; Move d0 to d1
str d1, [x3]              ; *outDouble = double1

ldp x29, x30, [sp], 16    ; restore frame pointer and link register
ret                       ; return
