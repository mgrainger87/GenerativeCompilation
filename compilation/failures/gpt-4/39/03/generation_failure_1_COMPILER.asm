; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpd4dbijrm.asm:12:11: error: expected floating-point constant #0.0
; fcmp d0, #10.0
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpd4dbijrm.asm:17:15: error: unexpected floating point literal
; fsub d0, d0, #1.0
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpd4dbijrm.asm:18:15: error: unexpected floating point literal
; fadd d1, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!
stp x29, lr, [sp, #-16]!

// Check if double1 < 10
fcmp d0, #10.0
blt 1f

// If false, call customFunction(int1, int2+2, double1-1, double2+1, outInt, outDouble)
add w1, w1, #2
fsub d0, d0, #1.0
fadd d1, d1, #1.0
bl _customFunction

// Restore callee-saved registers and return
ldp x29, lr, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret

1: // If true, *outInt = int1 * int2
mul w19, w0, w1
str w19, [x2]

// *outDouble = double1
str d0, [x3]

// Restore callee-saved registers and return
ldp x29, lr, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret
