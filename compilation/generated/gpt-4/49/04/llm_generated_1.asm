//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.text

_helperFunction:
fadd d0, d0, d1
ret

.global _customFunction
_customFunction:
add w4, w0, w1
str w4, [x2]
stp x30, x29, [sp, #-16]!   ; Save x30 (link register) and frame pointer x29 to the stack
bl _helperFunction
ldp x30, x29, [sp], #16     ; Restore x30 and x29
str d0, [x3]
ret
