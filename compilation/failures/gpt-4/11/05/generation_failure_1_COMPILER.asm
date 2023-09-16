; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpbho36ik7.asm:3:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpbho36ik7.asm:13:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
stp     lr, [sp, #-16]!
cmp     w0, w1
b.gt    1f
str     w1, [x2]
str     d1, [x3]
b       2f
1:
str     w0, [x2]
str     d0, [x3]
2:
ldp     lr, [sp], #16
ret
