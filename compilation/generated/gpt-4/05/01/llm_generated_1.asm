//compiler_errors=1,linker_errors=0,execution_errors=2,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save lr (link register)
sub     sp, sp, #16           // Adjust the stack pointer
str     lr, [sp]              // Save lr onto the stack

// *outDouble = double1;
str     d0, [x3]              // Store double1 into the memory location pointed by outDouble

// *outInt = int2;
str     w1, [x2]              // Store int2 into the memory location pointed by outInt

// Epilogue: Restore lr and return to caller
ldr     lr, [sp]              // Load lr from the stack
add     sp, sp, #16           // Adjust the stack pointer back
ret                           // Return to caller
