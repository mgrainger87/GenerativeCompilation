//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and other callee-saved registers
stp x29, x30, [sp, #-16]! // Save frame pointer and link register onto the stack
mov x29, sp               // Set frame pointer to current stack pointer

// Compute *outInt = int1 * 3 - int2;
mov w4, #3                // Load 3 into w4
mul w4, w4, w0            // Multiply int1 (in x0) by 3
sub w4, w4, w1            // Subtract int2 (in x1) from the result
str w4, [x2]              // Store the result to the address pointed by outInt (x2)

// Compute *outDouble = double1 - double2 * 3;
fmov d2, #3.0             // Load 3.0 into d2
fmul d2, d2, d1           // Multiply double2 (in d1) by 3.0
fsub d0, d0, d2           // Subtract the result from double1 (in d0)
str d0, [x3]              // Store the result to the address pointed by outDouble (x3)

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16   // Pop frame pointer and link register from the stack
ret                       // Return to the caller
