; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpqrihgmn0.asm:15:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpqrihgmn0.asm:27:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
.align 3

_helperFunction:
// Multiply a and b
mul w0, w0, w1
// Return the result
ret

.global _customFunction
.align 3

_customFunction:
// Save the link register to the stack
stp lr, [sp, #-16]!

// Call helperFunction to multiply int1 and int2
bl _helperFunction

// Store the result to the location pointed by outInt
str w0, [x2]

// Store double2 to the location pointed by outDouble
str d1, [x3]

// Restore the link register from the stack
ldp lr, [sp], #16

// Return to the caller
ret
