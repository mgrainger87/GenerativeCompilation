//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.p2align 2

_customFunction:
stp x19, x20, [sp, -16]!  ; Save callee-saved registers x19 and x20

mov x19, x0               ; Store int1 into x19
mov x20, x2               ; Store the pointer outInt into x20

str w19, [x20]            ; Store the value of int1 (from x19) into the address pointed by outInt
str d0, [x3]             ; Store the value of double1 into the address pointed by outDouble

ldp x19, x20, [sp], 16   ; Restore the values of x19 and x20
ret                      ; Return from function
