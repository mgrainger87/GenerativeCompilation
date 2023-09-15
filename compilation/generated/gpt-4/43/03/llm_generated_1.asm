//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.text
.align 3

.global _helperFunction
_helperFunction:
fmul d0, d0, d0
ret

.align 3

.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; Save frame pointer and link register to the stack
mov x29, sp                ; Update the frame pointer

str w0, [x2]
bl _helperFunction
str d0, [x3]

ldp x29, x30, [sp], #16   ; Restore frame pointer and link register from the stack
ret
