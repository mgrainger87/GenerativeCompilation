//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and other registers we might modify
stp x29, x30, [sp, #-16]! // Save frame pointer and link register
mov x29, sp // Set frame pointer

// Initialize *outInt = 0
mov w8, #0
str w8, [x2]

// Initialize loop counter with int1
mov w8, w0 // w8 will be our loop counter

1:  // Start of for loop
cmp w8, w1 // Compare loop counter with int2
b.gt 2f // If loop counter > int2, exit loop

// *outInt += i
ldr w9, [x2] // Load current value of *outInt to w9
add w9, w9, w8 // Add loop counter to w9
str w9, [x2] // Store the result back to *outInt

add w8, w8, #1 // Increment loop counter
b 1b // Jump back to the start of the loop

2:  // End of for loop

// Initialize *outDouble = 0.0
fmov d8, #0.0
str d8, [x3]

// Restore registers and return
ldp x29, x30, [sp], #16 // Restore frame pointer and link register
ret
