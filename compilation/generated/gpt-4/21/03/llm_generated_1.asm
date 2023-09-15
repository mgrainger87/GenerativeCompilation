//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and the link register
stp x29, x30, [sp, -16]!
mov x29, sp

// Initialize *outInt = 0
mov w4, #0
str w4, [x2]

// Initialize *outDouble = 0.0
fmov d4, #0.0
str d4, [x3]

// For loop initialization
mov w5, #1      // i = 1

1:  // For loop condition
cmp w5, w0      // Compare i with int1
bgt 2f          // If i > int1, break the loop

// Body of the loop
ldr w4, [x2]    // Load *outInt into w4
add w4, w4, w5  // *outInt += i
str w4, [x2]    // Store back the result

add w5, w5, #1  // i++
b 1b            // Jump back to the loop condition

2:  // End of function

// Restore callee-saved registers and the link register
ldp x29, x30, [sp], #16
ret
