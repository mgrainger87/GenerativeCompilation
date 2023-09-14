//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and x4
stp     x4, lr, [sp, #-16]!   // Push x4 and link register onto the stack

// *outInt = int1 * int2;
mul     x4, x0, x1            // Multiply x0 (int1) and x1 (int2), store in x4
str     w4, [x2]              // Store the result (32-bit value) at the address in x2 (outInt)

// *outDouble = double1 * double2;
fmul    d4, d0, d1            // Multiply d0 (double1) and d1 (double2), store in d4
str     d4, [x3]              // Store the result at the address in x3 (outDouble)

// Restore x4 and the link register and return
ldp     x4, lr, [sp], #16     // Pop x4 and link register from the stack
ret                           // Return to the caller
