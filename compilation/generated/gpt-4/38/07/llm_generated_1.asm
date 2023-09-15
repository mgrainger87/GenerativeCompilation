//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Prologue
stp x30, x4, [sp, #-16]!  // Save lr and a temporary register to the stack
mov x4, x30               // Save link register to x4 for later restoration

// Compare int2 (x1) with 5
cmp x1, #5
blt .Lif_block            // If int2 < 5, branch to .Lif_block

// else block (Recursive call to customFunction)
sub x1, x1, #2            // int2 = int2 - 2
fmov d2, #1.0             // Load 1.0 into d2
fsub d1, d1, d2           // double2 = double2 - 1.0 using d2

bl _customFunction        // Recursive call
b .Lend                   // Skip to the end after recursion

.Lif_block:
// *outInt = int1;
str w0, [x2]

// *outDouble = double1 + double2;
fadd d2, d0, d1           // d2 = double1 + double2
str d2, [x3]             // Store the result to *outDouble

.Lend:
// Epilogue
ldp x30, x4, [sp], #16   // Restore saved registers
ret                      // Return
