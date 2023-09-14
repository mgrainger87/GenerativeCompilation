//compiler_errors=4,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Load the immediate value 1.0 into d5
fmov d5, #1.0

// Store 1.0 to *outDouble
str d5, [x3]

// Initialize loop counter i to 0
mov w4, wzr

_loop_start:
// Check loop condition: i < int1
cmp w4, w0
b.ge _loop_end

// Multiply *outDouble by double1 * double2
fmul d5, d0, d1
ldr d6, [x3]
fmul d6, d6, d5
str d6, [x3]

// Increment loop counter i
add w4, w4, #1
b _loop_start

_loop_end:
// Set *outInt to 0
mov w4, wzr
str w4, [x2]

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret
