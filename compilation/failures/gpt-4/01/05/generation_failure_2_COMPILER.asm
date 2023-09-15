; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp1afd3wpw.asm:4:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp1afd3wpw.asm:19:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save lr to the stack
stp lr, [sp, #-16]!

// Add int1 and int2
add w4, w0, w1  // w4 = int1 + int2

// Store result to *outInt
str w4, [x2]

// Add double1 and double2
fadd d2, d0, d1  // d2 = double1 + double2

// Store result to *outDouble
str d2, [x3]

// Restore lr from the stack
ldp lr, [sp], #16

// Return from function
ret
