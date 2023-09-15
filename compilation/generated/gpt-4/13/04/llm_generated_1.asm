//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save link register and other callee-saved registers (if any) to the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int1 (w0) is equal to int2 (w1)
cmp w0, w1
bne .1_else

// If int1 == int2
// *outInt = int1 * int2
mul w4, w0, w1
str w4, [x2]

// Load double constants for addition
fadd d4, d0, d1
str d4, [x3]

b .1_end

// Else
.1_else:
mov w4, #0
str w4, [x2]

fmov d4, #0.0
str d4, [x3]

.1_end:

// Restore registers and return
ldp x29, x30, [sp], #16
ret
