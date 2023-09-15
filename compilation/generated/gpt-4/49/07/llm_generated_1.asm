//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fadd d0, d0, d1    ; d0 = a + b
ret
.global _customFunction
_customFunction:
; Save the link register and other necessary registers
stp x30, x19, [sp, #-16]!
add x19, x0, x1     ; x19 = int1 + int2
str w19, [x2]       ; *outInt = x19

; Call helperFunction
bl _helperFunction

; Store result of helperFunction in *outDouble
str d0, [x3]

; Restore registers and return
ldp x30, x19, [sp], #16
ret
