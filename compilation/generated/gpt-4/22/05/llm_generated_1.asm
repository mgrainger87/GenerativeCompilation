//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save the link register and callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outInt = 1;
mov w4, #1
str w4, [x2]

// Initialize loop counter
mov w5, #1 // w5 is the loop counter (i)

loop_start:
cmp w5, w0 // Compare i with int1
bgt loop_end // If i > int1, exit loop

// *outInt *= i;
ldr w4, [x2]       // Load current value of *outInt to w4
mul w4, w4, w5    // Multiply w4 by loop counter (i)
str w4, [x2]      // Store the result back to *outInt

// Increment loop counter and continue loop
add w5, w5, #1
b loop_start

loop_end:
// *outDouble = 0.0;
fmov d4, #0.0
str d4, [x3]

// Restore the link register and callee-saved registers and return
ldp x29, x30, [sp], #16
ret
