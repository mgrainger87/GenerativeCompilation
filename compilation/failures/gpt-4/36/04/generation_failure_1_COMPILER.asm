; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzur9ou_u.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzur9ou_u.asm:15:15: error: unexpected floating point literal
; fsub d0, d0, #0.1
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzur9ou_u.asm:16:15: error: unexpected floating point literal
; fadd d1, d1, #0.1
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzur9ou_u.asm:21:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzur9ou_u.asm:29:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global customFunction

customFunction:
// Save the link register to the stack (this will be restored before returning or branching)
stp     lr, [sp, #-16]!

// Compare double1 and double2
fcmp    d0, d1

// If double1 is equal to double2, then the branch is taken
beq     .equal

// Else, modify the values and call customFunction recursively
add     w1, w1, #1     // int2 = int2 + 1
fsub    d0, d0, #0.1   // double1 = double1 - 0.1
fadd    d1, d1, #0.1   // double2 = double2 + 0.1

bl      customFunction // Recursively call customFunction

// Restore the link register and return
ldp     lr, [sp], #16
ret

.equal:
str     w1, [x2]       // *outInt = int2
str     d1, [x3]       // *outDouble = double2

// Restore the link register and return
ldp     lr, [sp], #16
ret
