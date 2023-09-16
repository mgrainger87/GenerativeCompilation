; compiler_errors=2,linker_errors=0,execution_errors=1,correctness_errors=1
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp4evc2t86.asm:18:9: error: invalid operand for instruction
; mov d0, d1
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
.global _customFunction

.align 2
_helperFunction:
fneg    d0, d0
ret

.align 2
_customFunction:
// Save link register to stack
str     lr, [sp, #-16]!

// Store int1 to *outInt
str     w0, [x2]

// Move double2 to d0
mov     d0, d1

// Call helperFunction with double2
bl      _helperFunction

// Store result of helperFunction to *outDouble
str     d0, [x3]

// Restore link register from stack
ldr     lr, [sp], #16

ret
