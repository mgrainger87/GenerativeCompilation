//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
neg w0, w0       ; return -a
ret
.global _customFunction
_customFunction:
; Save the link register (since we're calling another function)
stp x30, x29, [sp, #-16]! ; Push x30 (LR) and x29 (FP) onto the stack and adjust the stack pointer
mov x29, sp       ; Set the frame pointer to the current stack pointer

; Call helperFunction with int2 (x1) as the argument
mov x0, x1        ; Move int2 into x0 for helperFunction
bl _helperFunction; Call helperFunction

; Store the result (in x0) to the location pointed to by outInt (x2)
str w0, [x2]

; Store double1 (d0) to the location pointed to by outDouble (x3)
str d0, [x3]

; Restore the link register and return
ldp x30, x29, [sp], #16 ; Pop x30 and x29 from the stack and adjust the stack pointer
ret
