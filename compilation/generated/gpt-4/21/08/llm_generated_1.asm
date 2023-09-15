//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2
_customFunction:
// Save the link register
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Initialize *outInt to 0
mov     w5, #0
str     w5, [x2]

// Initialize i to 1
mov     w4, #1

1:  // Start of the loop
// Check if i > int1
cmp     w4, w0
bgt     2f   // Branch to the end of the loop if condition is met

// Increment *outInt by i
ldr     w5, [x2]
add     w5, w5, w4
str     w5, [x2]

// Increment i
add     w4, w4, #1
b       1b

2:  // End of loop

// Set *outDouble to 0.0
fmov    d5, #0.0
str     d5, [x3]

// Restore the link register and return
ldp     x29, x30, [sp], #16
ret
