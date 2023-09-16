; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpp4qnqqxt.asm:4:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpp4qnqqxt.asm:29:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save link register
stp     lr, [sp, #-16]!

// Initialize *outInt = 0
mov     w6, #0                   // Temporary register to hold 0
str     w6, [x4]                 // Store 0 to *outInt

// For loop setup
mov     w6, w0                   // Copy int1 to w6 (loop iterator)
cmp     w6, w1                   // Compare int1 with int2
bgt     .Lend_for                // If int1 > int2, exit loop

.Lstart_for:
ldr     w7, [x4]                 // Load *outInt to w7
add     w7, w7, w6               // Add iterator to *outInt
str     w7, [x4]                 // Store updated value to *outInt
add     w6, w6, #1               // Increment iterator
cmp     w6, w1                   // Compare iterator with int2
ble     .Lstart_for              // If iterator <= int2, loop again

.Lend_for:
// Initialize *outDouble = 0.0
fmov    d6, #0.0                 // Temporary register to hold 0.0
str     d6, [x5]                 // Store 0.0 to *outDouble

// Restore link register and return
ldp     lr, [sp], #16
ret
