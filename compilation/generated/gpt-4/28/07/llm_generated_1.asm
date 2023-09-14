//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store necessary registers for later recovery
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp               // Set frame pointer to current stack pointer

// *outInt = int1;
str w0, [x2]

// Initialize loop counter i = 0 in w4 (local variable)
mov w4, #0

1:  // Loop label

// Compare i (w4) with double1 (d0)
fcvtzs w5, d0             // Convert double1 to int in w5
cmp w4, w5
b.ge 2f                   // Exit loop if i >= double1

// *outInt += int2;
ldr w6, [x2]              // Load *outInt into w6
add w6, w6, w1            // Add int2 to it
str w6, [x2]              // Store the result back to *outInt

// Increment loop counter i
add w4, w4, #1

b 1b                      // Jump back to loop label

2:  // Loop exit label

// *outDouble = 0.0;
fmov d7, #0.0             // Load 0.0 into d7
str d7, [x3]              // Store d7 to *outDouble

// Restore saved registers and return
ldp x29, x30, [sp], #16  // Restore frame pointer and link register
ret                      // Return to caller
