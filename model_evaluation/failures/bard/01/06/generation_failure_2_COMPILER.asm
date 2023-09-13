; compiler_errors=4,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpapqzp3ar.asm:9:11: error: invalid operand for instruction
; ldr x19, [int1]
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpapqzp3ar.asm:10:11: error: invalid operand for instruction
; ldr x20, [int2]
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpapqzp3ar.asm:11:10: error: invalid operand for instruction
; ldr d0, [double1]
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpapqzp3ar.asm:12:10: error: invalid operand for instruction
; ldr d1, [double2]
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpapqzp3ar.asm:15:12: error: invalid operand for instruction
; stur x19, [outInt]
;            ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpapqzp3ar.asm:16:11: error: invalid operand for instruction
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

// Load arguments
ldr x19, [int1]
ldr x20, [int2]
ldr d0, [double1]
ldr d1, [double2]

// Store arguments to output pointers
stur x19, [outInt]
stur d0, [outDouble]

// Function epilogue:
// Restore callee-saved registers
ldp x19, x20, [sp], #16
ldp x21, x22, [sp], #32

// Return
ret
