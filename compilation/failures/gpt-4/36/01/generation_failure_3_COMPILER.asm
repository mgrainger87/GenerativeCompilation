; compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplnk2eb4f.asm:22:10: error: invalid operand for instruction
; ldr d4, [d4]
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.data
fp_const:
.double 0.1

.text
.global customFunction
customFunction:
// Save the link register (return address)
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Compare the two double values
fcmp    d0, d1

// If they're equal, jump to the 'equal' label
beq     1f

// If not equal:
add     w1, w1, #1       // int2 += 1

ldr     d4, =fp_const    // Load address of fp_const into an x register
ldr     d4, [d4]         // Dereference to load 0.1 into register D4
fsub    d0, d0, d4       // double1 -= 0.1
fadd    d1, d1, d4       // double2 += 0.1

// Recursive call to customFunction
bl      customFunction

// Restore link register and return
ldp     x30, x29, [sp], #16
ret

1:  // Equal label
// Set values of outInt and outDouble
str     w1, [x2]         // *outInt = int2
str     d1, [x3]         // *outDouble = double2

// Restore link register and return
ldp     x30, x29, [sp], #16
ret
