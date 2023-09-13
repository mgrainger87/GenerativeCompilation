//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 4               ; align on 16-byte boundary

_customFunction:
stp x19, x20, [sp, #-16]!   ; Save callee-saved registers onto the stack

mov x19, x0                 ; Move int1 to x19 for safe keeping
mov x20, x1                 ; Move int2 to x20 (though we don't actually use x20)

str x19, [x2]               ; Store int1 into *outInt
str d0, [x3]                ; Store double1 into *outDouble

ldp x19, x20, [sp], #16    ; Restore the saved registers
ret                        ; Return
