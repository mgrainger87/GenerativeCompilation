; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdlu7ycl8.asm:16:15: error: unexpected floating point literal
; fsub d0, d0, #0.1
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdlu7ycl8.asm:17:15: error: unexpected floating point literal
; fadd d1, d1, #0.1
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl _customFunction
.align 2
_customFunction:
// Save the link register, and callee-saved registers if needed.
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare double1 and double2
fcmp d0, d1

// If they are equal, execute the following block
beq .1_equal

// If not equal, modify int2, double1, double2 and call customFunction recursively
add w1, w1, #1
fsub d0, d0, #0.1
fadd d1, d1, #0.1
bl _customFunction

// Restore the link register and return
ldp x29, x30, [sp], #16
ret

.1_equal:
// Store int2 to *outInt
str w1, [x2]

// Store double2 to *outDouble
str d1, [x3]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
