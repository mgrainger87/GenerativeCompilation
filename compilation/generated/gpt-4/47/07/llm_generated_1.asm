//compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=1
.global _helperFunction
_helperFunction:
fneg    d0, d0       ; Negate the value in d0
ret                 ; Return to the caller

.global _customFunction
_customFunction:
stp     x29, x30, [sp, #-16]!   ; Save the frame pointer (x29) and link register (x30) to the stack
mov     x29, sp                ; Set the frame pointer to the current stack pointer

str     w0, [x2]               ; Store the value of int1 (in w0) to the location pointed to by outInt (x2)

fmov    d0, d1                 ; Move the value of double2 (in d1) to d0

bl      _helperFunction        ; Call helperFunction with the value in d0

str     d0, [x3]               ; Store the result from helperFunction (in d0) to the location pointed to by outDouble (x3)

ldp     x29, x30, [sp], #16    ; Restore the frame pointer (x29) and link register (x30) from the stack

ret                            ; Return to the caller
