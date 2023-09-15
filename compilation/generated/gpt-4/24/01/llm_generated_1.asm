//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store callee saved registers and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Initialize *outDouble to 0.0
fmov d4, #0.0
str d4, [x3]

// Initialize the counter to zero
mov w4, #0

loop_start:
// Compare i (in w4) with int1 (in w0)
cmp w4, w0
b.ge loop_end

// Increment *outDouble by double1
ldr d4, [x3]
fadd d4, d4, d0
str d4, [x3]

// Increment the counter
add w4, w4, #1

// Jump to the start of the loop
b loop_start

loop_end:
// Set *outInt to 0
mov w5, #0
str w5, [x2]

// Restore callee saved registers and return
ldp x29, x30, [sp], #16
ret
