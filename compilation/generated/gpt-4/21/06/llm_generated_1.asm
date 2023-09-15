//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save callee-saved registers and the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Initialize *outInt to 0
mov w4, #0
str w4, [x2]

// Initialization for the loop
mov w4, #1    // i = 1

.loop_start:
cmp w4, w0    // Compare i with int1
bgt .loop_end // If i > int1, exit loop

// *outInt += i
ldr w5, [x2]  // Load current value of *outInt into w5
add w5, w5, w4
str w5, [x2]  // Store updated value back to *outInt

add w4, w4, #1 // Increment i
b .loop_start   // Jump back to loop start

.loop_end:
// Initialize *outDouble to 0.0
fmov d4, #0.0
str d4, [x3]

// Restore callee-saved registers and the link register
ldp x29, x30, [sp], #16

ret
