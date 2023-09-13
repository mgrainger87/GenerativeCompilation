//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
stp x19, x20, [sp, #-16]!   ; Save callee-saved registers

mov x19, x0                 ; Store int1 into x19
str x19, [x2]               ; Store the value of int1 into *outInt

str d0, [x3]                ; Store the value of double1 into *outDouble

ldp x19, x20, [sp], #16     ; Restore callee-saved registers

ret
