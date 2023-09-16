; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpo_r9o1tq.asm:4:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpo_r9o1tq.asm:7:9: error: Immediate too large for register
; ldr d8, =10.0
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpo_r9o1tq.asm:21:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpo_r9o1tq.asm:29:9: error: Immediate too large for register
; ldr d8, =1.0
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpo_r9o1tq.asm:39:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save lr to stack as we'll be calling another function
stp lr, [sp, #-16]!  // pre-decrement stack pointer

// Compare double1 (d0) with 10.0
ldr d8, =10.0        // Load 10.0 into d8
fcmp d0, d8          // Compare d0 with d8

// If double1 < 10, then jump to .1_else
b.ge .1_else

// *outInt = int1 * int2
mul w4, w0, w1       // Multiply w0 and w1, store in w4
str w4, [x2]        // Store w4 to *outInt

// *outDouble = double1
str d0, [x3]        // Store d0 to *outDouble

// Load lr from stack and return
ldp lr, [sp], #16
ret

.1_else:
// int2+2
add w1, w1, #2

// double1-1
ldr d8, =1.0
fsub d0, d0, d8

// double2+1
fadd d1, d1, d8

// Call customFunction recursively
bl _customFunction

// Load lr from stack and return
ldp lr, [sp], #16
ret
