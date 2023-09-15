//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: save link register
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// *outInt = int2;
str     w1, [x2]

// for(int i = 0; i < (int)double2; i++)
// Convert double2 (d1) to integer in w4
fcvtzs  w4, d1
// Initialize loop counter i in w5 to 0
mov     w5, #0

1:  // Start of loop
cmp     w5, w4
b.ge    2f  // Exit loop if i >= (int)double2

// Inside loop: *outInt -= int1;
ldr     w6, [x2]
sub     w6, w6, w0
str     w6, [x2]

// Increment loop counter i
add     w5, w5, #1
b       1b  // Repeat loop

2:  // End of loop

// *outDouble = 0.0;
// Load 0.0 into a floating point register (d4 for example)
fmov    d4, #0.0
str     d4, [x3]

// Epilogue: restore link register and return
ldp     x30, x29, [sp], #16
ret
