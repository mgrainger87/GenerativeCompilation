; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpw44nvd1s.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpw44nvd1s.asm:24:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
.align 2
_customFunction:
// Save link register
stp lr, [sp, #-16]!

// Calculate *outInt = int1 + int2 * 2;
// Multiply int2 by 2 and store the result in w1
lsl w1, w1, #1
// Add int1 and the doubled int2, storing the result in w0
add w0, w0, w1
// Store the result to the memory address pointed to by x2 (outInt)
str w0, [x2]

// Calculate *outDouble = double1 * 2 + double2;
// Multiply double1 by 2 and store the result in d0
fadd d0, d0, d0
// Add the result to double2, storing the result in d0
fadd d0, d0, d1
// Store the result to the memory address pointed to by x3 (outDouble)
str d0, [x3]

// Restore link register and return
ldp lr, [sp], #16
ret
