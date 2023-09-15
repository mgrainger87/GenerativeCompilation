; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpmuz87qb1.asm:13:11: error: expect relocation specifier in operand after ':'
; adrp x4, :gotpage:0.1
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpmuz87qb1.asm:14:16: error: expect relocation specifier in operand after ':'
; ldr d4, [x4, #:gotpage_lo12:0.1]
;                ^
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

// Load the floating point literals into registers
adrp x4, :gotpage:0.1
ldr  d4, [x4, #:gotpage_lo12:0.1]

// Adjust arguments for the recursive call
add x1, x1, #1 // Increment int2
fsub d0, d0, d4 // Decrement double1 by 0.1
fadd d1, d1, d4 // Increment double2 by 0.1

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
