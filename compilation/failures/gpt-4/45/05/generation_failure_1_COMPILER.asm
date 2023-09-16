; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdk4s9_v_.asm:10:9: error: invalid operand for instruction
; mov d0, d2
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdk4s9_v_.asm:11:9: error: invalid operand for instruction
; mov d1, d3
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
_helperFunction:
fdiv d0, d0, d1
ret

.global _customFunction
_customFunction:
stp x30, xzr, [sp, #-16]!
str w1, [x2]
mov d0, d2
mov d1, d3
bl _helperFunction
str d0, [x3]
ldp x30, xzr, [sp], #16
ret
