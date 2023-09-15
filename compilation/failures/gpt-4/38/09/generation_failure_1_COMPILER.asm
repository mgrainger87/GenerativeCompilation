; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpw4lma21y.asm:28:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save link register to the stack to preserve it (required since we're making a function call)
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare int2 (x1) with 5
cmp w1, #5

// Branch if greater or equal to label 1
b.ge 1f

// Save int1 to *outInt
str w0, [x2]

// Calculate double1 + double2 and store the result in *outDouble
fadd d4, d0, d1
str d4, [x3]

// Restore link register and return
ldp x29, x30, [sp], #16
ret

1:  // Else part

// Update int2 and double2 for recursive call
sub x1, x1, #2
fsub d1, d1, #1.0

// Recursive call to customFunction
bl _customFunction

// Restore the altered values
add x1, x1, #2
fmov d4, #1.0
fadd d1, d1, d4

// Restore link register and return
ldp x29, x30, [sp], #16
ret
