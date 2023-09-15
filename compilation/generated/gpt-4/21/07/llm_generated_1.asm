//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Function prologue
stp x29, x30, [sp, -16]!   // Save frame pointer and return address
mov x29, sp               // Set frame pointer to current stack pointer

// Set *outInt to 0
mov w4, #0                // Move immediate value 0 to w4 register
str w4, [x2]              // Store w4 to memory location pointed by x2 (outInt)

// Initialize loop counter in w4
mov w4, #1

_loop_start:
// Check if loop counter (w4) is greater than int1 (w0)
cmp w4, w0                // Compare w4 with w0
bgt _loop_end             // If w4 > w0, branch to loop end

// Update *outInt
ldr w5, [x2]              // Load value from *outInt to w5
add w5, w5, w4            // Add loop counter to w5
str w5, [x2]              // Store w5 to memory location pointed by x2 (outInt)

// Increment loop counter
add w4, w4, #1            // Increment w4
b _loop_start             // Branch back to start of loop

_loop_end:
// Set *outDouble to 0.0
fmov d4, #0.0             // Move floating point 0.0 to d4 register
str d4, [x3]              // Store d4 to memory location pointed by x3 (outDouble)

// Function epilogue
ldp x29, x30, [sp], 16    // Restore frame pointer and return address
ret                       // Return from function
