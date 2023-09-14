//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x30, x19, [sp, #-16]!   // Save x30 and w19 to the stack

// *outInt = int1;
str w0, [x2]

// for(int i = 0; i < (int)double1; i++)
mov w19, #0                // Initialize i to 0
1:  // Start of the loop
fcvtzs w20, d0             // Convert double1 to integer
cmp w19, w20               // Compare i with converted double1
b.ge 2f                    // If i >= double1, exit loop

// *outInt += int2;
ldr w21, [x2]              // Load current value of *outInt to w21
add w21, w21, w1           // Add int2 to it
str w21, [x2]              // Store the result back to *outInt

// Increment loop counter
add w19, w19, #1
b 1b                      // Go to the start of the loop

2:  // End of the loop

// *outDouble = 0.0;
fmov d22, #0.0
str d22, [x3]

// Restore the link register and w19
ldp x30, x19, [sp], #16

ret
