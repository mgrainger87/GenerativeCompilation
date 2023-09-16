//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!  // Push x19 and x20 onto the stack

// Initialize *outInt = 1
mov w19, #1               // Using w19 as a temporary register for *outInt value
str w19, [x2]             // Store w19 to *outInt

// Initialize loop counter i to 1
mov w20, #1               // Using w20 as the loop counter

1:  // Start of loop
// Check loop condition: i <= int1
cmp w20, w0               // Compare i (w20) with int1 (x0)
bgt 2f                    // If i > int1, exit loop

// Loop body: *outInt *= i
ldr w19, [x2]             // Load *outInt to w19
mul w19, w19, w20         // Multiply w19 with i (w20)
str w19, [x2]             // Store w19 back to *outInt

// Increment loop counter i
add w20, w20, #1          // Increment i (w20)
b 1b                      // Jump back to start of loop

2:  // End of loop

// Initialize *outDouble = 0.0
fmov d19, #0.0            // Using d19 as a temporary register for *outDouble value
str d19, [x3]             // Store d19 to *outDouble

// Restore callee-saved registers and return
ldp x19, x20, [sp], #16   // Pop x19 and x20 from the stack
ret                       // Return from function
