; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpl2pgokjv.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpl2pgokjv.asm:37:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction

_customFunction:
// Save the link register (lr)
stp lr, [sp, #-16]!

// Calculate int1 + int2
add w4, w0, w1

// Compare the result with 100
cmp w4, #100

// If the result is <= 100, jump to the else block
ble .1_else_block

// int1 + int2 > 100
mov w5, #100
str w5, [x2]   // Store 100 to *outInt

// Calculate double1 * double2
fmul d2, d0, d1
str d2, [x3]   // Store the result to *outDouble

// Jump to the end
b .2_end

.1_else_block:
// Store the result of int1 + int2 to *outInt
str w4, [x2]

// Calculate double1 + double2
fadd d2, d0, d1
str d2, [x3]   // Store the result to *outDouble

.2_end:
// Restore the link register and return
ldp lr, [sp], #16
ret
