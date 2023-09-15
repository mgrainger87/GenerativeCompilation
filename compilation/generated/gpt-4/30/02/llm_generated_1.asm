//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Prologue: Save registers that we will modify
stp     x29, x30, [sp, #-16]!  // Save frame pointer and link register to the stack
mov     x29, sp                // Set frame pointer to current stack pointer

// *outInt = int2
str     w1, [x2]

// Prepare for the loop
fcvtzs  w4, d1                 // Convert double2 to integer; store it in w4
cbz     w4, .Lend_loop         // If the loop count is 0, jump to end of loop

// Loop
.Lloop_start:
sub     w5, w4, #1             // Decrement loop counter
ldr     w6, [x2]               // Load *outInt to w6
sub     w6, w6, w0             // w6 = w6 - int1
str     w6, [x2]               // Store the result back to *outInt
cbnz    w5, .Lloop_start       // If loop counter is not zero, continue loop

.Lend_loop:
// *outDouble = 0.0
fmov    d7, #0.0               // Move 0.0 to d7
str     d7, [x3]               // Store d7 to *outDouble

// Epilogue: Restore registers and return
ldp     x29, x30, [sp], #16   // Restore frame pointer and link register
ret
