; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpppwvjrn7.asm:4:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpppwvjrn7.asm:13:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Store the link register
stp     lr, [sp, #-16]!

// *outInt = int2;
str     w1, [x2]

// *outDouble = double1;
str     d0, [x3]

// Restore the link register and return
ldp     lr, [sp], #16
ret
