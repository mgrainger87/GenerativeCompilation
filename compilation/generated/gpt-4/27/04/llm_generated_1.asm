//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Function Prologue
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register to the stack
mov x29, sp               // Set frame pointer to current stack pointer

// Initialize *outDouble to 1.0
fmov d4, #1.0             // Load 1.0 into d4
str d4, [x3]              // Store d4 to the address in x3 (outDouble)

// Loop from 0 to int1-1
mov w5, wzr               // Initialize loop counter i to 0
1:  cmp w5, w0                // Compare i with int1
bge 2f                    // If i >= int1, break the loop
fmul d4, d0, d1           // Multiply double1 with double2, result in d4
ldr d5, [x3]              // Load *outDouble to d5
fmul d4, d4, d5           // Multiply d4 with d5
str d4, [x3]              // Store d4 to the address in x3 (outDouble)
add w5, w5, #1            // Increment i
b 1b                      // Jump back to the loop start

2:  // Set *outInt to 0
mov w4, wzr               // Load 0 into w4
str w4, [x2]              // Store w4 to the address in x2 (outInt)

// Function Epilogue
ldp x29, x30, [sp], #16   // Restore frame pointer and link register from the stack
ret                       // Return from function
