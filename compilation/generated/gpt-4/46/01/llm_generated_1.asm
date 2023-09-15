//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.global _helperFunction
.align 2  ; Ensure alignment. 2^2 = 4 bytes
_helperFunction:
mul w0, w0, w1  ; Multiply a and b
ret             ; Return with result in w0

.global _customFunction
.align 2  ; Ensure alignment. 2^2 = 4 bytes
_customFunction:
; Save the link register (x30)
stp x30, xzr, [sp, #-16]!

; Call helperFunction to calculate *outInt
bl _helperFunction

; Store the result in *outInt
str w0, [x2]

; Store double2 in *outDouble
fmov d0, d1
str d0, [x3]

; Restore the link register (x30) and return
ldp x30, xzr, [sp], #16
ret
