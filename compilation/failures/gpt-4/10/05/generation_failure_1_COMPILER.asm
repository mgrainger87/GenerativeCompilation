; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptvt97pwq.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptvt97pwq.asm:25:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:

// Store the link register to preserve it
stp lr, [sp, #-16]!

// Calculate int1 + int2 + 5
add w4, w0, w1         // w4 = int1 + int2
add w4, w4, #5         // w4 = w4 + 5

// Store the result in *outInt
str w4, [x2]

// Load 5.0 into a floating point register
fmov d2, #5.0

// Calculate double1 + double2 + 5.0
fadd d3, d0, d1       // d3 = double1 + double2
fadd d3, d3, d2       // d3 = d3 + 5.0

// Store the result in *outDouble
str d3, [x3]

// Restore the link register
ldp lr, [sp], #16

// Return
ret
