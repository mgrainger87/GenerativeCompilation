; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnzxyzdc6.asm:14:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction

_customFunction:
// Save the link register to the stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Compare int1 with 5
cmp w0, #5
blt 1f // If int1 < 5, branch to the first local label

// Recursive function call path
sub w0, w0, #3 // int1 = int1 - 3
fadd d0, d0, #1.0 // double1 = double1 + 1
bl _customFunction

// Restore the link register and return
ldp x30, x29, [sp], #16
ret

1:  // int1 < 5 path
add w4, w0, w1 // w4 = int1 + int2
str w4, [x2]  // *outInt = w4

fmov d2, d1   // Move double2 to d2
str d2, [x3]  // *outDouble = d2

// Restore the link register and return
ldp x30, x29, [sp], #16
ret
