//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: save link register and fp
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Store int1 value to the location pointed to by outInt
str     w0, [x2]

// Check if int2 <= 0, if yes skip the loop
cbz     w1, .Lend_loop

.Lloop_start:
// Multiply the value at outInt by 2
ldr     w4, [x2]
lsl     w4, w4, #1
str     w4, [x2]

// Decrement int2
subs    w1, w1, #1
// If int2 is not zero, loop again
cbnz    w1, .Lloop_start

.Lend_loop:
// Set outDouble to 0.0
fmov    d4, #0.0
str     d4, [x3]

// Epilogue: restore link register and fp, then return
ldp     x29, x30, [sp], #16
ret
