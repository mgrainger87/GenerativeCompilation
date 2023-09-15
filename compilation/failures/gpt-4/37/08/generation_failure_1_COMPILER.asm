; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwkvcnxwo.asm:20:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl  _customFunction
.align  2
_customFunction:
// Save the link register (x30) and frame pointer (x29)
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Save registers that will be clobbered by the function call
stp     x0, x1, [sp, #-16]!
stp     x2, x3, [sp, #-16]!
stp     d0, d1, [sp, #-16]!

// Check if int1 (x0) is less than 5
cmp     w0, #5
blt     1f

// If int1 >= 5:
// Call customFunction(int1-2, int2, double1+1, double2, outInt, outDouble)
sub     w0, w0, #2
fadd    d0, d0, #1.0
bl      _customFunction

// Restore the saved registers and return
ldp     d0, d1, [sp], #16
ldp     x2, x3, [sp], #16
ldp     x0, x1, [sp], #16
ldp     x29, x30, [sp], #16
ret

1:  // If int1 < 5:
// *outInt = int1 + int2
add     w4, w0, w1
str     w4, [x2]

// *outDouble = double2
fmov    d3, d1
str     d3, [x3]

// Restore the saved registers and return
ldp     d0, d1, [sp], #16
ldp     x2, x3, [sp], #16
ldp     x0, x1, [sp], #16
ldp     x29, x30, [sp], #16
ret
