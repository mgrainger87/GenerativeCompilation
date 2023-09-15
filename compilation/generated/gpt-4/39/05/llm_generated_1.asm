//compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=0
.align 4
.global _customFunction
_customFunction:
// Save the link register and the callee-saved registers to the stack.
stp x29, x30, [sp, #-16]!  // Store pair of 64-bit regs: frame pointer and link register
mov x29, sp                // Set up the frame pointer

// Compare double1 (d0) with 10.
fmov d2, #10.0              // Move 10.0 into d2 for comparison
fcmp d0, d2                // Compare d0 and d2
b.ge .else_branch          // If double1 >= 10, jump to .else_branch

// double1 < 10
// *outInt = int1 * int2;
mul w4, w0, w1              // Multiply w0 and w1, and store the result in w4
str w4, [x2]                // Store the result from w4 to memory location pointed by outInt (x2)

// *outDouble = double1;
fmov d3, d0                 // Move value of d0 to d3
str d3, [x3]                // Store the double value from d3 to memory location pointed by outDouble (x3)

// Restore the link register and frame pointer, then return.
ldp x29, x30, [sp], #16     // Load pair: Restore frame pointer and link register
ret                         // Return to the caller

.align 4
.else_branch:
// customFunction(int1, int2+2, double1-1, double2+1, outInt, outDouble);
add w1, w1, #2              // Add 2 to int2

fmov d3, #1.0               // Load 1.0 into d3
fsub d0, d0, d3             // Subtract 1 from double1 using d3
fadd d1, d1, d3             // Add 1 to double2 using d3

bl _customFunction          // Branch with link: call customFunction recursively
