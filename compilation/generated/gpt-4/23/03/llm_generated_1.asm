//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp     x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov     x29, sp                // Set frame pointer to current stack pointer

// Store int1 value to *outInt
str     w0, [x2]

// Initialize i to 0
mov     w4, #0  // w4 will be our loop counter 'i'

loop_start:
// Check loop condition i < int2
cmp     w4, w1
b.ge    loop_end

// *outInt *= 2
ldr     w5, [x2]   // Load *outInt to w5
lsl     w5, w5, #1 // Logical shift left by 1 (equivalent to multiplying by 2)
str     w5, [x2]   // Store back the result to *outInt

// Increment i
add     w4, w4, #1
b       loop_start

loop_end:
// Set *outDouble to 0.0
fmov    d4, #0.0  // Move 0.0 to d4 register
str     d4, [x3]  // Store d4 to *outDouble

// Epilogue
ldp     x29, x30, [sp], #16   // Restore frame pointer and link register
ret                          // Return
