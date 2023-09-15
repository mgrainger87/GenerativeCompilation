//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Store callee-saved registers and create stack frame
stp x19, x20, [sp, #-16]!

// Initialize *outInt to 0
mov w20, wzr
str w20, [x2]

// Check if int1 <= 0
cmp w0, #0
ble .end_loop

.loop:
// *outInt += i
add w20, w20, w0
str w20, [x2]

// Decrement int1 and repeat loop if it is still greater than 0
subs w0, w0, #1
bgt .loop

.end_loop:
// Initialize *outDouble to 0.0
fmov d0, #0.0
str d0, [x3]

// Restore callee-saved registers and return
ldp x19, x20, [sp], #16
ret
