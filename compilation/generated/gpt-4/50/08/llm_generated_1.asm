//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
add x0, x0, #10  ; a + 10
ret
.global _customFunction
_customFunction:
; Save link register (lr) to stack
str lr, [sp, #-16]!

; Call helperFunction with int1 (x0)
bl _helperFunction

; Store the result (*outInt = x0) to the address in x2
str w0, [x2]

; Store double2 (d1) to the address in x3
str d1, [x3]

; Restore link register and return
ldr lr, [sp], #16
ret
