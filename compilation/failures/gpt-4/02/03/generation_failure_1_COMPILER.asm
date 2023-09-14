; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpamb5hvuo.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpamb5hvuo.asm:15:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
.align  2
_customFunction:
// Prologue
stp     lr, [sp, #-16]!    // Save link register to stack

// Body of the function
sub     w4, w0, w1         // int1 - int2
str     w4, [x2]          // Store result to *outInt

fsub    d2, d0, d1        // double1 - double2
str     d2, [x3]          // Store result to *outDouble

// Epilogue
ldp     lr, [sp], #16     // Restore link register from stack
ret                        // Return
