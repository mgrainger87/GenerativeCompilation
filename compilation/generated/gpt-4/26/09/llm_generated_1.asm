//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
.global _customFunction
_customFunction:
// Prologue: Save required registers
stp x29, x30, [sp, -16]!
mov x29, sp               // Set frame pointer to the current stack pointer

// Initialize *outInt to 0
mov w4, #0                // Load 0 into w4
str w4, [x2]              // Store w4 value to the address pointed by x2 (outInt)

// Check if int1 > int2, if true skip the loop
cmp w0, w1                // Compare int1 (w0) with int2 (w1)
b.gt 1f                   // If int1 > int2, branch to label 1

// Loop to sum integers between int1 and int2
0:
ldr w4, [x2]              // Load *outInt to w4
add w4, w4, w0            // Add value of int1 (w0) to w4
str w4, [x2]              // Store updated value back to *outInt
add w0, w0, #1            // Increment int1 (w0)
cmp w0, w1                // Compare int1 (w0) with int2 (w1)
b.le 0b                   // If int1 <= int2, repeat the loop

// Initialize *outDouble to 0.0
1:
fmov d4, #0.0             // Load 0.0 into d4
str d4, [x3]              // Store 0.0 (from d4) to address pointed by x3 (outDouble)

// Epilogue: Restore registers and return
ldp x29, x30, [sp], #16   // Pop values for x29 and x30 from stack, adjust stack pointer
ret                       // Return to the caller
