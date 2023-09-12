; compiler_errors=7,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpl6x6v4dg.asm:13:12: error: invalid operand for instruction
; stur x19, [outInt]
;            ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpl6x6v4dg.asm:14:11: error: invalid operand for instruction
; stur d0, [outDouble]
;           ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; // Function signature: void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble)

// Function prologue:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-32]!

// Move arguments to registers
mov x19, int1
mov x20, int2

// Store arguments to output pointers
stur x19, [outInt]
stur d0, [outDouble]

// Function epilogue:
// Restore callee-saved registers
ldp x19, x20, [sp], #16
ldp x21, x22, [sp], #32

// Return
ret
