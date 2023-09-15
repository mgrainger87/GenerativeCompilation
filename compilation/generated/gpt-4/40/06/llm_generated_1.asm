//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Preserve link register (for the return address) and other necessary registers
stp x29, x30, [sp, #-16]!  // Store FP (x29) and LR (x30) to stack
mov x29, sp                // Set FP to SP

// Check if double2 (d1) < 10
fmov d2, #10.0             // Load 10.0 into d2
fcmp d1, d2                // Compare double2 with 10.0
b.lt .lessThan10           // If less than, jump to .lessThan10

// Else branch: Recursive call
add w0, w0, #2             // int1 = int1 + 2
fmov d2, #1.0              // Load 1.0 into d2 for addition and subtraction
fadd d0, d0, d2            // double1 = double1 + 1
fsub d1, d1, d2            // double2 = double2 - 1
bl _customFunction         // Recursive call

// Restore registers and return
ldp x29, x30, [sp], #16    // Restore FP and LR from stack
ret                        // Return

.lessThan10:
// *outInt = int2
str w1, [x2]               // Store int2 to *outInt

// *outDouble = double1 * double2
fmul d2, d0, d1            // Multiply double1 by double2
str d2, [x3]               // Store result to *outDouble

// Restore registers and return
ldp x29, x30, [sp], #16    // Restore FP and LR from stack
ret                        // Return
