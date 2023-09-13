; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj8j0jttl.asm:11:10: error: expected compatible register or floating-point constant
; fmov d0, double1
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj8j0jttl.asm:12:10: error: expected compatible register or floating-point constant
; fmov d1, double2
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj8j0jttl.asm:15:11: error: invalid operand for instruction
; str x19, [outInt]
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj8j0jttl.asm:16:10: error: invalid operand for instruction
; str d0, [outDouble]
;          ^
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
mov x19, int1
mov x20, int2
fmov d0, double1
fmov d1, double2

// Store arguments to output pointers
str x19, [outInt]
str d0, [outDouble]

// Function epilogue:
// Restore callee-saved registers
ldp x19, x20, [sp], #16
ldp x21, x22, [sp], #32

// Return
ret
