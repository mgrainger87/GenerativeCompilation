; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmps9lgd1sk.asm:4:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmps9lgd1sk.asm:15:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Store the link register to keep the return address
stp lr, [sp, #-16]!   // Pre-decrement stack by 16 bytes to store the link register

// No other caller-saved registers are modified, so we don't need to save them.

// Set *outInt = int1
str w0, [x2]          // Store w0 (int1) to the memory location pointed by x2 (outInt)

// Set *outDouble = double2
str d1, [x3]          // Store d1 (double2) to the memory location pointed by x3 (outDouble)

// Restore the link register
ldp lr, [sp], #16     // Load the link register and post-increment the stack pointer by 16 bytes

ret
