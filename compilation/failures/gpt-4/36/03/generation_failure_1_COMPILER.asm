; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpmxvtm98j.asm:16:15: error: unexpected floating point literal
; fsub d0, d0, #0.1
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpmxvtm98j.asm:17:15: error: unexpected floating point literal
; fadd d1, d1, #0.1
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global customFunction
customFunction:
// Save link register (lr) and other callee-saved registers if used
stp lr, x30, [sp, #-16]! // Store pair of registers and decrement SP

// Compare the double values d0 and d1
fcmp d0, d1

// Branch to equal (beq) label if d0 == d1
beq .1_equal

// If double1 != double2, perform recursive call

// Adjust arguments for the recursive call
add x1, x1, #1 // Increment int2
fsub d0, d0, #0.1 // Decrement double1 by 0.1
fadd d1, d1, #0.1 // Increment double2 by 0.1

// Call the function recursively
bl customFunction

// Restore link register and other callee-saved registers
ldp lr, x30, [sp], #16

// Return
ret

.1_equal:
// If double1 == double2, store int2 to outInt and double2 to outDouble

// Store int2 (x1) at the address in outInt (x2)
str w1, [x2]

// Store double2 (d1) at the address in outDouble (x3)
str d1, [x3]

// Restore link register and other callee-saved registers
ldp lr, x30, [sp], #16

// Return
ret
