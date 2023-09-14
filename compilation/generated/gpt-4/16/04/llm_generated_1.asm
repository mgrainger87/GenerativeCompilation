//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.global _customFunction

_customFunction:
// Save the link register (lr) to the stack to preserve the return address
stp     lr, x30, [sp, #-16]!   // Use x30 as a temporary register for stack adjustment

// Check if int1 is even using AND operation
and     w30, w0, #1            // AND the least significant bit of int1 with 1
cbnz    w30, .1_oddCase        // If the result is not 0 (i.e., int1 is odd), branch to the oddCase label

// Even case:
lsr     w30, w0, #1            // Shift right by 1 to divide int1 by 2
str     w30, [x2]              // Store the result in *outInt

fmov    d30, #2.0              // Load 2.0 into floating-point register d30
fmul    d30, d30, d0           // Multiply double1 by 2.0
str     d30, [x3]              // Store the result in *outDouble
b       .2_endFunction         // Branch to end of function

// Odd case:
.1_oddCase:
str     w0, [x2]               // Store int1 in *outInt
str     d0, [x3]               // Store double1 in *outDouble

// End of function
.2_endFunction:
// Restore the link register (lr) from the stack
ldp     lr, xzr, [sp], #16     // Restore lr and adjust stack pointer, discard the other value
ret                            // Return
