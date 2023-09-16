; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzjfbzpvt.asm:19:9: error: Immediate too large for register
; ldr d4, =0.1
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
.align  2
_customFunction:
// Save the link register to the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare double1 (d0) and double2 (d1)
fcmp d0, d1
b.eq .equal

// If not equal, modify arguments and make a recursive call

// int2 + 1 -> w1
add w1, w1, #1

// double1 - 0.1 -> d0
// Load 0.1 into a floating point register
ldr  d4, =0.1
fsub d0, d0, d4

// double2 + 0.1 -> d1
fadd d1, d1, d4

// Make the recursive call
bl _customFunction

// Restore the link register and return
ldp x29, x30, [sp], #16
ret

.equal:
// Set *outInt to int2
str w1, [x2]

// Set *outDouble to double2
str d1, [x3]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
