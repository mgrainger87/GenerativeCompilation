//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
; Function prologue: save frame pointer and link register
stp x29, x30, [sp, #-16]!   ; Store pair with pre-indexed write-back
mov x29, sp                ; Set frame pointer

; int1 * int1
mul w4, w0, w0             ; w4 = int1 * int1

; Store the result at *outInt
str w4, [x2]               ; Store the result of multiplication to the address pointed by outInt

; double2 * double2
fmul d4, d1, d1            ; d4 = double2 * double2

; Store the result at *outDouble
str d4, [x3]               ; Store the result of multiplication to the address pointed by outDouble

; Function epilogue: restore frame pointer and link register
ldp x29, x30, [sp], #16   ; Load pair with post-indexed write-back
ret                       ; Return to caller
