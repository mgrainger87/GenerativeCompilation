//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fadd d0, d0, d1   ; d0 = a + b
ret
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; Save frame pointer and link register to stack
mov x29, sp                ; Set frame pointer

add w4, w0, w1             ; w4 = int1 + int2
str w4, [x2]               ; *outInt = w4

bl _helperFunction         ; Call helperFunction(double1, double2)
str d0, [x3]               ; *outDouble = result of helperFunction

ldp x29, x30, [sp], #16    ; Restore frame pointer and link register
ret
