//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and other registers we plan to modify
stp x30, x29, [sp, #-16]!
mov x29, sp
stp x2, x3, [sp, #-16]!
stp d0, d1, [sp, #-16]!

// Initialize *outDouble = 1.0
fmov d3, #1.0
str d3, [x3]

// Initialize loop counter i to 0
mov w4, wzr

.loop_start:
// Compare i with int1
cmp w4, w0
b.ge .loop_end

// Calculate *outDouble *= double1 * double2
ldr d0, [sp]
ldr d1, [sp, #8]
fmul d2, d0, d1
ldr d3, [x3]
fmul d3, d3, d2
str d3, [x3]

// Increment i
add w4, w4, #1
b .loop_start

.loop_end:
// Set *outInt = 0
mov w5, wzr
str w5, [x2]

// Restore registers and return
ldp d0, d1, [sp], #16
ldp x2, x3, [sp], #16
ldp x30, x29, [sp], #16
ret
