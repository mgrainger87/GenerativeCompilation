; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplu1n_rs5.asm:16:10: error: expected compatible register or floating-point constant
; fmov d4, #0.1
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global customFunction
customFunction:
// Save link register and any callee-saved registers (none in this case)
stp     lr, x30, [sp, #-16]!  // save lr to stack (for recursive call)

// Compare double1 and double2
fcmp    d0, d1

// Branch if equal
beq     .1_equal

// Recursive call case:
// int2+1
add     w1, w1, #1
// double1-0.1
fmov    d4, #0.1
fsub    d0, d0, d4
// double2+0.1
fadd    d1, d1, d4
// Recursive call
bl      customFunction
// Restore link register and return
ldp     lr, x30, [sp], #16
ret

.1_equal:
// *outInt = int2
str     w1, [x2]
// *outDouble = double2
str     d1, [x3]
// Restore link register and return
ldp     lr, x30, [sp], #16
ret
