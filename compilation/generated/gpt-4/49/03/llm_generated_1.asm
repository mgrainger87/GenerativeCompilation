//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
_helperFunction:         ; Marked static, so not global
fadd d0, d0, d1     ; d0 = d0 + d1 (a + b)
ret                 ; Return with result in d0
.globl _customFunction
_customFunction:
; *outInt = int1 + int2;
add w4, w0, w1
str w4, [x2]

; Save the link register (LR) to the stack
stp x30, xzr, [sp, #-16]!

; Call helperFunction
bl _helperFunction

; Restore the link register (LR) from the stack
ldp x30, xzr, [sp], #16

; *outDouble = result from helperFunction
str d0, [x3]

ret
