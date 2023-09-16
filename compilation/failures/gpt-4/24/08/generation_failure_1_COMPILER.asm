; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpc3dkgv8t.asm:15:14: error: invalid operand for instruction
; fadd d4, d4, v0
;              ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!
mov x29, sp

fmov d4, #0.0
str d4, [x3]

mov w5, #0
1:
cmp w5, w0
bge 2f

ldr d4, [x3]
fadd d4, d4, v0
str d4, [x3]
add w5, w5, #1
b 1b

2:
mov w4, #0
str w4, [x2]

ldp x29, x30, [sp], #16
ret
