; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzptyleol.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzptyleol.asm:29:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl  _customFunction
.align  2
_customFunction:
// Save the link register
stp     lr, [sp, #-16]!

// Check if int2 % 3 == 0
mov     w4, #3
sdiv    w5, w1, w4
msub    w5, w5, w4, w1
cmp     w5, #0

// If int2 % 3 == 0, set result as int1 * int1. Else, set result as int2 * int2.
madd    w5, w0, w0, wzr      // w5 = int1 * int1
madd    w6, w1, w1, wzr      // w6 = int2 * int2
csel    w5, w5, w6, eq       // If equal (int2 % 3 == 0), select w5, else select w6
str     w5, [x2]             // Store the result to *outInt

// Check if double1 is equal to double2
fcmp    d0, d1

// If double1 == double2, set result as 0.0. Else, set result as double1 + double2.
fmov    d2, #0.0             // Load immediate 0.0 to d2
fadd    d3, d0, d1           // d3 = double1 + double2
fcsel   d2, d2, d3, eq       // If equal (double1 == double2), select d2, else select d3
str     d2, [x3]             // Store the result to *outDouble

// Restore the link register and return
ldp     lr, [sp], #16
ret
