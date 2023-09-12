; compiler_errors=4,linker_errors=3,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnw0abzee.asm:19:11: error: invalid operand for instruction
; fmov x22, x19
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnw0abzee.asm:20:11: error: invalid operand for instruction
; fmov x23, x20
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnw0abzee.asm:23:6: error: invalid operand for instruction
; fmul x26, x22, x23
;      ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; // Function prologue
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-32]!

// Load the arguments
ldr x19, [sp, #24] // int1
ldr x20, [sp, #32] // int2
ldr x22, [sp, #40] // double1
ldr x23, [sp, #48] // double2
ldr x24, [sp, #56] // outInt
ldr x25, [sp, #64] // outDouble

// Custom function
// Add the values of `int1` and `int2`
add x21, x19, x20

// Move the values of `int1` and `int2` into floating-point registers
fmov x22, x19
fmov x23, x20

// Multiply the values of `double1` and `double2`
fmul x26, x22, x23

// Store the results
str x21, [x24]
str x26, [x25]

// Function epilogue
// Restore callee-saved registers
ldp x19, x20, [sp], #16
ldp x21, x22, [sp], #32
ret
