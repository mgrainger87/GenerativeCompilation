; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplrhjeoul.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplrhjeoul.asm:20:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction

_customFunction:
// Save link register to stack
stp lr, [sp, #-16]!   // Pre-indexed addressing mode

// Compute int1 * int1
mul w4, w0, w0        // w4 = int1 * int1

// Dereference outInt and store result
str w4, [x2]

// Compute double2 * double2
fmul d4, d1, d1       // d4 = double2 * double2

// Dereference outDouble and store result
str d4, [x3]

// Restore link register and return
ldp lr, [sp], #16
ret
