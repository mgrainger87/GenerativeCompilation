//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
add w0, w0, w1       ; add a and b
ret                  ; return result in x0

.global _customFunction
_customFunction:
; Save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

; Call helperFunction(int1, int2)
bl _helperFunction

; Store the result of helperFunction at *outInt
str w0, [x2]

; Compute double1 + double2 and store in d0
fadd d0, d0, d1

; Store the result at *outDouble
str d0, [x3]

; Restore link register and return
ldp x30, x29, [sp], #16
ret
