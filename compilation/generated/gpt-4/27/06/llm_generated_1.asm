//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save necessary callee-saved registers
stp x19, x30, [sp, #-16]!   // Save x19 (a callee-saved register that we'll use) and x30 (the link register)

// Initialize *outDouble to 1.0
mov x19, 1                  // We use x19 as a temporary register to hold the integer representation of 1.0
scvtf d19, x19              // Convert the integer 1 in x19 to a floating-point number in d19
str d19, [x3]               // Store the floating-point 1.0 to the address in x3 (outDouble)

// Initialize loop counter i to 0
mov w19, 0                  // Use w19 for i

loop_start:
// Check if i < int1
cmp w19, w0                 // Compare i with int1
bge loop_end               // If i >= int1, exit loop

// *outDouble *= double1 * double2
fmul d18, d0, d1           // d18 = double1 * double2
ldr d19, [x3]              // Load *outDouble into d19
fmul d19, d19, d18         // Multiply *outDouble with d18
str d19, [x3]              // Store the result back to *outDouble

// Increment i
add w19, w19, 1
b loop_start

loop_end:
// Set *outInt to 0
str wzr, [x2]              // Store zero to the address in x2 (outInt)

// Restore callee-saved registers and return
ldp x19, x30, [sp], #16    // Pop x19 and x30 from the stack
ret
