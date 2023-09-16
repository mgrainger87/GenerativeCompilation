; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpk_4mot5w.asm:4:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpk_4mot5w.asm:16:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Storing the link register to preserve it
stp lr, [sp, #-16]!

// Calculate int1 - int2 and store the result at the address pointed by outInt
sub w4, w0, w1     // w4 = int1 - int2
str w4, [x2]       // *outInt = w4

// Load the immediate floating point value into a floating-point register and then
// perform the subtraction for the double values and store the result
fsub d2, d0, d1    // d2 = double1 - double2
str d2, [x3]       // *outDouble = d2

// Restore the link register
ldp lr, [sp], #16

// Return
ret
