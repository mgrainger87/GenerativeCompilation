//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.text
.align 2
.globl _helperFunction
_helperFunction:
; Add 10 to the input integer
add x0, x0, #10
; Return the result in x0
ret

.align 2
.globl _customFunction
_customFunction:
; Save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

; Call helperFunction with the first integer parameter
bl _helperFunction

; Store the result at the address given by the outInt pointer
str x0, [x2]

; Store double2 directly to the address provided by the outDouble pointer
str d1, [x3]

; Restore the link register and frame pointer
ldp x30, x29, [sp], #16

; Return
ret
