//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and any other callee-saved registers we might use
stp x29, x30, [sp, #-16]!    // Push x29 (frame pointer) and x30 (link register) onto the stack
mov x29, sp                  // Set the frame pointer to the current stack pointer

// Compare int2 (x1) with 0
cmp w1, #0                   // Compare w1 (32-bit) with 0

// Based on the comparison, set the value of *outInt (x2)
csel w4, w0, w1, lt           // Select w0 (int1) if less than, else select w1 (int2). Store result in w4.
str w4, [x2]                 // Store the result in the memory location pointed to by outInt (x2)

// Now, we compare double1 (d0) and double2 (d1)
fcmp d0, d1                  // Compare d0 with d1

// Based on the comparison, set the value of *outDouble (x3)
fcsel d2, d0, d1, gt         // Select d0 if greater than, else select d1. Store result in d2.
str d2, [x3]                 // Store the result in the memory location pointed to by outDouble (x3)

// Restore the saved registers and return
ldp x29, x30, [sp], #16      // Pop x29 and x30 from the stack
ret                          // Return to the caller
