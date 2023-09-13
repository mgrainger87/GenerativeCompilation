//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction   ; Mangled name for global visibility
_customFunction:
; Save registers that will be modified and need to be preserved
stp x19, x20, [sp, #-16]!   ; Push x19 and x20 onto the stack
stp x21, x22, [sp, #-16]!   ; Push x21 and x22 onto the stack

; Move arguments to preserved registers (Optional step, but follows the initial structure)
mov x19, x0  ; int1
mov x20, x1  ; int2
mov x21, x2  ; outInt
mov x22, x3  ; outDouble

; Store int1 to the location pointed by outInt
str w19, [x21]

; Store double1 to the location pointed by outDouble
str d0, [x22]

; Restore registers
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16

ret
