; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj2btxhdz.asm:12:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj2btxhdz.asm:23:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
.global _customFunction

_helperFunction:
// Multiply the values in w0 and w1, and place the result in w0
mul w0, w0, w1
// Return
ret

_customFunction:
// Save the link register
stp lr, [sp, #-16]!

// Call helperFunction with w0 and w1 as arguments
bl _helperFunction
// Store the result (in w0) to the location pointed by x2
str w0, [x2]

// Assign double2 (d1) to the location pointed by x3
str d1, [x3]

// Restore the link register and return
ldp lr, [sp], #16
ret
