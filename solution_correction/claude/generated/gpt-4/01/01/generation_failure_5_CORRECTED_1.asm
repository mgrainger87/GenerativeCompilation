//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.p2align 2
_customFunction:
stp x29, x30, [sp,#-16]!  ; Save frame pointer and return address on the stack
mov x29, sp               ; Update frame pointer to current stack pointer

str w0, [x2]              ; Store `int1` (w0) to the address pointed by `outInt` (x2)
str d0, [x3]              ; Store `double1` (d0) to the address pointed by `outDouble` (x3)

ldp x29, x30, [sp],#16    ; Restore frame pointer and return address from the stack
ret                       ; Return
