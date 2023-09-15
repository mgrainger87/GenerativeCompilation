; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpa87wt1_x.asm:21:1: error: unexpected token at start of statement
; .0:
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpa87wt1_x.asm:32:1: error: unexpected token at start of statement
; .1:
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl _customFunction
.align 2
_customFunction:
// Save the link register (lr) to the stack. Also save x19 (to be used as counter)
stp x19, lr, [sp, #-16]!

// Initialize outDouble to 0.0
movz x4, #0 // Clear out x4 to use it as a temporary register
str d4, [x3] // Store 0.0 to outDouble

// Initialize outInt to 0
mov w5, #0
str w5, [x2]

// Check if int1 is 0, if yes skip the loop
cbz w0, .1f

// Use x19 as the loop counter
mov w19, #0

.0:
// Add double1 to outDouble
ldr d5, [x3]
fadd d5, d5, d0
str d5, [x3]

// Increment counter (x19) and compare to int1 (w0)
add w19, w19, #1
cmp w19, w0
b.lt .0b

.1:
// Restore the link register and x19
ldp x19, lr, [sp], #16

ret
