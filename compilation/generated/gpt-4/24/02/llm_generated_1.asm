//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save callee-saved registers and link register
stp     x29, x30, [sp, #-16]!   // Save frame pointer and link register onto the stack
mov     x29, sp                 // Set the frame pointer to the current stack pointer

// Initialize *outDouble = 0.0
fmov    d8, #0.0                // Load 0.0 into a temporary floating point register (d8)
str     d8, [x3]               // Store d8 to the memory location pointed by x3 (outDouble)

// For-loop initialization
mov     w8, wzr                // Set w8 to 0; w8 will act as the loop counter 'i'

.loop_start:
// Check the loop condition: i < int1
cmp     w8, w0                 // Compare w8 (i) with w0 (int1)
b.ge    .loop_end              // If i is greater than or equal to int1, exit loop

// Loop body: *outDouble += double1
ldr     d9, [x3]               // Load current value of *outDouble into d9
fadd    d9, d9, d0             // Add double1 (d0) to d9
str     d9, [x3]               // Store the result back to *outDouble

// Increment loop counter 'i' and go back to the beginning of the loop
add     w8, w8, #1             // Increment w8 (i)
b       .loop_start            // Go back to the loop start

.loop_end:
// Set *outInt = 0
mov     w9, wzr                // Load 0 into w9
str     w9, [x2]               // Store w9 to the memory location pointed by x2 (outInt)

// Restore callee-saved registers and return
ldp     x29, x30, [sp], #16    // Restore frame pointer and link register from the stack
ret                            // Return from the function
