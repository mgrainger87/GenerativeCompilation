; compiler_errors=1,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpg1gx6w2p.asm:7:9: error: invalid operand for instruction
; bic sp, sp, #15
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _helperFunction
_helperFunction:
// Save original stack pointer
mov x28, sp

// Align stack to 16-byte boundary
bic sp, sp, #15

stp x29, x30, [sp, #-16]!
mov x29, sp

fmul d0, d0, d0

ldp x29, x30, [sp], #16

// Restore original stack pointer
mov sp, x28

ret

.global _customFunction
_customFunction:
str w0, [x2]
bl _helperFunction
str d0, [x3]
ret
