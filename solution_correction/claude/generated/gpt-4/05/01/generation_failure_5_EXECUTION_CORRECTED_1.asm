//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.align 2
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]! ; Store frame and link register to stack
mov x29, sp               ; Set up frame pointer

str w0, [x2]              ; Store int1 into *outInt
str d0, [x3]              ; Store double1 into *outDouble

ldp x29, x30, [sp], #16   ; Restore frame and link register
ret                       ; Return
