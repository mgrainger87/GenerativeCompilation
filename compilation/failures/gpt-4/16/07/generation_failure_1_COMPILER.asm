; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpxz5qmsiw.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpxz5qmsiw.asm:27:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction

_customFunction:
// Save the link register to the stack for safe keeping.
stp     lr, [sp, #-16]!

// Check if int1 (w0) is even
ands    w4, w0, #1         // AND int1 with 1 and set flags. w4 is a temporary register.
b.ne    .Lodd              // If result is not 0 (int1 is odd), branch to .Lodd

// If int1 is even:
lsr     w5, w0, #1         // w5 = int1 / 2
str     w5, [x2]           // Store w5 to outInt

fmov    d5, #2.0           // Load 2.0 into floating point register d5
fmul    d5, d0, d5         // Multiply double1 with 2.0
str     d5, [x3]           // Store d5 to outDouble
b       .Lend              // Branch to end

.Lodd:
// If int1 is odd:
str     w0, [x2]           // Store int1 to outInt
str     d0, [x3]           // Store double1 to outDouble

.Lend:
// Restore the link register from the stack
ldp     lr, [sp], #16
ret
