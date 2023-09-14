; compiler_errors=1,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpsmnl3exc.asm:4:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpsmnl3exc.asm:13:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Prologue: Save lr (link register)
stp     lr, [sp, #-16]!       // Save lr onto the stack

// *outDouble = double1;
str     d0, [x3]              // Store double1 into the memory location pointed by outDouble

// *outInt = int2;
str     w1, [x2]              // Store int2 into the memory location pointed by outInt

// Epilogue: Restore lr and return to caller
ldp     lr, [sp], #16         // Pop lr from the stack
ret                           // Return to caller
