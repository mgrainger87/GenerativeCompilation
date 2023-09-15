//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
mul w0, w0, w1       ; Multiply a and b
ret
.global _customFunction
_customFunction:
; Preserve link register
stp x30, x29, [sp, #-16]!
mov x29, sp

; Call helperFunction(int1, int2)
bl _helperFunction

; Store result of helperFunction to *outInt
str w0, [x2]

; Store double2 to *outDouble
str d1, [x3]

; Restore link register and frame pointer
ldp x30, x29, [sp], #16
ret
