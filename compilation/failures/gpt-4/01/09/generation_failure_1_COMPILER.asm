; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp5h9lho2w.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp5h9lho2w.asm:20:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global customFunction
.align 3
customFunction:
// Store lr (link register) to stack since we need to preserve it
stp     lr, [sp, #-16]!

// Add the integer values
add     w4, w0, w1

// Store the result of the integer addition to *outInt (which is in x2)
str     w4, [x2]

// Load the immediate values for the floating point addition to registers
fadd    d2, d0, d1

// Store the result of the floating point addition to *outDouble (which is in x3)
str     d2, [x3]

// Restore lr from stack
ldp     lr, [sp], #16

// Return from function
ret
