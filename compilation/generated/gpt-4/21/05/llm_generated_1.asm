//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x29, x30, [sp, #-16]!   // Store pair of 64-bit regs to memory: frame pointer and link register
mov x29, sp                 // Set frame pointer for this function frame

// Initialize *outInt to 0
mov w4, #0                  // Use w4 as a temporary register
str w4, [x2]                // Store w4 (which is 0) to memory at address in x2

// Initialize the loop counter and accumulator
mov w5, #1                  // w5 will be our loop counter, i
mov w6, #0                  // w6 will be our accumulator for the sum

loop_start:
cmp w5, w0                  // Compare i (w5) to int1 (x0)
bgt loop_end                // If i > int1, exit loop

// Accumulate sum
add w6, w6, w5              // *outInt += i
add w5, w5, #1              // i++

b loop_start                // Go back to start of loop

loop_end:
str w6, [x2]                // Store the final result to *outInt

// Initialize *outDouble to 0.0
fmov d4, #0.0               // Use d4 as a temporary floating-point register
str d4, [x3]                // Store d4 (which is 0.0) to memory at address in x3

// Restore the link register and return
ldp x29, x30, [sp], #16     // Load pair of 64-bit regs from memory and adjust stack pointer
ret                         // Return
