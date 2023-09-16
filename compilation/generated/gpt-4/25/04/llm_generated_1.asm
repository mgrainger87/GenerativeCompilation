//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store caller-saved registers and link register
stp x29, x30, [sp, #-16]!   // Store FP (x29) and LR (x30)
mov x29, sp                 // Set up frame pointer

// *outDouble = double1
str d0, [x3]

// Set up loop
mov w4, #0                  // loop counter, use w4 as a temporary register for the counter
loop_start:
cmp w4, w0                  // Compare loop counter with int1
bge loop_end                // If w4 >= w0, exit loop

// *outDouble -= double2
ldr d5, [x3]                // Load current value of *outDouble to d5
fsub d5, d5, d1             // Subtract double2 from d5
str d5, [x3]                // Store result back to *outDouble

// Increment loop counter and loop back
add w4, w4, #1              // Increment loop counter
b loop_start                // Go to loop start

loop_end:
// *outInt = 0
str wzr, [x2]               // Store zero to memory pointed by outInt

// Restore saved registers and return
ldp x29, x30, [sp], #16    // Restore FP and LR
ret                         // Return to caller
