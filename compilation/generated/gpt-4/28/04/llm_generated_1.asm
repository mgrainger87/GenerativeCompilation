//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Prologue: Save callee-saved registers and link register
stp     x29, x30, [sp, #-16]!    // Save frame pointer and link register
mov     x29, sp                  // Set frame pointer to current stack pointer

// *outInt = int1;
str     w0, [x2]                 // Store w0 (int1) to address in x2 (outInt)

// for(int i = 0; i < (int)double1; i++)
fcvtns  w4, d0                   // Convert double1 to signed int, store in w4
mov     w5, #0                   // Initialize loop counter i to 0

1:  // Loop label
cmp     w5, w4                   // Compare i with (int)double1
bge     2f                       // Branch to label 2 if i >= (int)double1

// *outInt += int2;
ldr     w6, [x2]                 // Load current value of *outInt into w6
add     w6, w6, w1               // Add int2 to it
str     w6, [x2]                 // Store updated value back to *outInt

add     w5, w5, #1               // Increment loop counter i
b       1b                       // Jump back to loop label

2:  // End of loop label

// *outDouble = 0.0;
fmov    d7, #0.0                 // Load 0.0 into d7 register
str     d7, [x3]                 // Store d7 to address in x3 (outDouble)

// Epilogue: Restore callee-saved registers and return
ldp     x29, x30, [sp], #16      // Restore frame pointer and link register
ret                              // Return
