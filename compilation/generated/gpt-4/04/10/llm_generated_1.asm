//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store the link register to keep the return address
str lr, [sp, #-16]!   // Pre-decrement stack by 16 bytes to store the link register

// Set *outInt = int1
str w0, [x2]          // Store w0 (int1) to the memory location pointed by x2 (outInt)

// Set *outDouble = double2
str d1, [x3]          // Store d1 (double2) to the memory location pointed by x3 (outDouble)

// Restore the link register
ldr lr, [sp], #16     // Load the link register and post-increment the stack pointer by 16 bytes

ret
