//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:

// Function prologue: save x30 (link register) and reserve stack space
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outDouble = 1.0;
fmov d4, #1.0
str d4, [x3]

// Initialize loop counter (i) to 0
mov w5, #0

1:  // Start of the loop
cmp w5, w0       // Compare i with int1
bge 2f           // If i >= int1, exit loop

// *outDouble *= double1 * double2;
ldr d4, [x3]     // Load *outDouble into d4
fmul d6, d0, d1  // double1 * double2 -> d6
fmul d4, d4, d6  // d4 *= d6
str d4, [x3]     // Store result back to *outDouble

// Increment loop counter (i)
add w5, w5, #1
b 1b             // Jump back to start of loop

2:  // End of loop

// *outInt = 0;
mov w4, #0       // Load 0 into w4
str w4, [x2]     // Store 0 to *outInt

// Function epilogue: restore x30 and deallocate stack space
ldp x29, x30, [sp], #16
ret
