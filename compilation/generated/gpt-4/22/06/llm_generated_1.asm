//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp               // Set up new frame pointer

// *outInt = 1;
mov w4, #1                // Load 1 into w4
str w4, [x2]              // Store w4 to the memory location pointed by outInt (x2)

// for(int i = 1; i <= int1; i++)
mov w5, #1                // Counter i starts at 1 (stored in w5)
1:  cmp w5, w0                // Compare i (w5) with int1 (x0)
bgt 2f                    // If i > int1, exit the loop

// *outInt *= i;
ldr w4, [x2]              // Load value at outInt into w4
mul w4, w4, w5            // Multiply w4 with i (w5)
str w4, [x2]              // Store result back to outInt

add w5, w5, #1            // Increment i (w5)
b 1b                      // Jump back to the beginning of the loop

2:  // *outDouble = 0.0;
fmov d4, #0.0             // Load 0.0 into d4
str d4, [x3]              // Store d4 to the memory location pointed by outDouble (x3)

// Epilogue
ldp x29, x30, [sp], #16   // Restore frame pointer and link register
ret                       // Return
