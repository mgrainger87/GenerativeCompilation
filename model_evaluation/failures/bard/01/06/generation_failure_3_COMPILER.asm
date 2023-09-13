; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpb0ghbtcx.asm:11:9: error: invalid operand for instruction
; mov d0, double1
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpb0ghbtcx.asm:12:9: error: invalid operand for instruction
; mov d1, double2
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpb0ghbtcx.asm:15:11: error: invalid operand for instruction
; str x19, [outInt]
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpb0ghbtcx.asm:16:10: error: invalid operand for instruction
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

// Move arguments to registers
mov x19, int1
mov x20, int2
mov d0, double1
mov d1, double2

// Store arguments to output pointers
str x19, [outInt]
str d0, [outDouble]

// Function epilogue:
// Restore callee-saved registers
ldp x19, x20, [sp], #16
ldp x21, x22, [sp], #32

// Return
ret
