; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmppw8b1_dk.asm:12:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmppw8b1_dk.asm:24:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _helperFunction
.global _customFunction

.align 2
_helperFunction:
fneg    d0, d0
ret

.align 2
_customFunction:
// Save link register to stack
stp     lr, [sp, #-16]!

// Store int1 to *outInt
str     w0, [x2]

// Call helperFunction with double2
bl      _helperFunction

// Store result of helperFunction to *outDouble
str     d0, [x3]

// Restore link register from stack
ldp     lr, [sp], #16

ret
