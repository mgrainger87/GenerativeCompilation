; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpeej7d_jo.asm:15:10: error: invalid operand for instruction
; fmul d4, v1, v1
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl _customFunction
.align 2
_customFunction:
// Save the link register to the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform integer multiplication: int1 * int1
mul w4, w0, w0

// Store the result in *outInt
str w4, [x2]

// Perform floating-point multiplication: double2 * double2
fmul d4, v1, v1

// Store the result in *outDouble
str d4, [x3]

// Restore link register from the stack and return
ldp x29, x30, [sp], #16
ret
