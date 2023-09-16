; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp02dmriu3.asm:14:9: error: invalid operand for instruction
; mov d0, d1
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
.global _customFunction

.text

.align 3
_helperFunction:
fneg d0, d0
ret

.align 3
_customFunction:
str w0, [x2]
mov d0, d1
bl _helperFunction
str d0, [x3]
ret
