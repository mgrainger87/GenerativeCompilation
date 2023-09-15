; compiler_errors=2,linker_errors=0,execution_errors=3,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpl648xpw4.asm:8:10: error: invalid operand for instruction
; sub x27, #16, x27
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _helperFunction
_helperFunction:
// Save original stack pointer
mov x28, sp

// Compute adjustment to align stack to 16-byte boundary
and x27, x28, #15
sub x27, #16, x27
sub sp, x28, x27

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
