//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.p2align 2
_customFunction:
stp x29, x30, [sp, #-16]!  ; Store FP and LR to the stack
mov x29, sp               ; Set FP to the current stack pointer

str w0, [x2]              ; Store int1 to *outInt
str d0, [x3]              ; Store double1 to *outDouble

ldp x29, x30, [sp], #16   ; Restore FP and LR from the stack
ret                       ; Return from function
