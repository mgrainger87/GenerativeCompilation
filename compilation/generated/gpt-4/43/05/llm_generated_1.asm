//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.global _helperFunction
_helperFunction:
fmul d0, d0, d0  ; Multiply a by itself
ret

.global _customFunction
_customFunction:
str w0, [x2]     ; Store the value of int1 to outInt
stp x30, x29, [sp, #-16]! ; Push x30 (lr) and x29 (frame pointer) to the stack
bl _helperFunction  ; Call helperFunction with double1
ldp x30, x29, [sp], #16 ; Pop x30 (lr) and x29 (frame pointer) from the stack
str d0, [x3]     ; Store the result of helperFunction to outDouble
ret
