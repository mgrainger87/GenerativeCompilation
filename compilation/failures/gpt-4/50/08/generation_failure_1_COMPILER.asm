; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpe3dw73o6.asm:8:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpe3dw73o6.asm:20:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
_helperFunction:
add x0, x0, #10  ; a + 10
ret
.global _customFunction
_customFunction:
; Save link register (lr) to stack
stp lr, [sp, #-16]!

; Call helperFunction with int1 (x0)
bl _helperFunction

; Store the result (*outInt = x0) to the address in x2
str w0, [x2]

; Store double2 (d1) to the address in x3
str d1, [x3]

; Restore link register and return
ldp lr, [sp], #16
ret
