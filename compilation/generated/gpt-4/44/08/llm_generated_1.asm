//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; Ensure proper alignment for arm64 functions
.align 3

; helperFunction
.globl _helperFunction
_helperFunction:
mul w0, w0, w0
ret

.align 3

; customFunction
.globl _customFunction
_customFunction:
stp x30, x29, [sp, #-16]!
mov x29, sp

bl _helperFunction

str w0, [x2]

fsub d0, d0, d1
str d0, [x3]

ldp x30, x29, [sp], #16
ret
