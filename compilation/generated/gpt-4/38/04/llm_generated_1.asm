//compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
.globl _customFunction
.align 3
_customFunction:
// Save the link register (lr) and a temporary register x29 for extra safety
stp     lr, x29, [sp, #-16]!

// Check if int2 (x1) is less than 5
cmp     w1, #5
blt     .Lless_than_5

// Else part for int2 >= 5

// int2 = int2 - 2; x1 = x1 - 2;
sub     w1, w1, #2

// double2 = double2 - 1; d1 = d1 - 1;
fmov    d2, #1.0    // Load 1.0 into d2
fsub    d1, d1, d2  // Subtract 1.0 from double2

// Call customFunction recursively
bl      _customFunction

// Restore link register and return
ldp     lr, x29, [sp], #16
ret

.Lless_than_5:
// *outInt = int1; *x2 = x0;
str     w0, [x2]

// *outDouble = double1 + double2; *x3 = d0 + d1;
fadd    d2, d0, d1
str     d2, [x3]

// Restore link register and return
ldp     lr, x29, [sp], #16
ret
