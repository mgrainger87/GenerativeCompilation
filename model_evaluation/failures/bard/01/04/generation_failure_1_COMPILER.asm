; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpe4tiyxv8.asm:17:10: error: invalid operand for instruction
; str x0, [outInt]
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpe4tiyxv8.asm:18:10: error: invalid operand for instruction
; str x2, [outDouble]
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .text
.global customFunction
customFunction:
// Save callee-saved registers
mov x19, x0
mov x20, x1
mov x21, x2
mov x22, x3

// Load parameters
mov x0, int1
mov x1, int2
mov x2, double1
mov x3, double2

// Store the return values
str x0, [outInt]
str x2, [outDouble]

// Restore callee-saved registers
mov x0, x19
mov x1, x20
mov x2, x21
mov x3, x22

// Return
ret
