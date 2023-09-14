//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Check if int1 (w0) is even: int1 % 2 == 0
and w4, w0, #1         // w4 will contain the result of (int1 & 1)
cmp w4, #0             // Compare w4 with 0

// If even, execute the if branch
beq .1_even

// Else branch: *outInt = int1; *outDouble = double1;
str w0, [x2]           // Store int1 to *outInt
fmov d1, d0            // Move double1 to d1 (just for clarity, though not necessary)
str d1, [x3]           // Store double1 to *outDouble
b .2_end

// Even branch: *outInt = int1 / 2; *outDouble = double1 * 2.0;
.1_even:
lsr w4, w0, #1         // w4 = int1 / 2
str w4, [x2]           // Store w4 to *outInt
fmov d1, #2.0          // Load 2.0 to d1
fmul d1, d0, d1        // d1 = double1 * 2.0
str d1, [x3]           // Store d1 to *outDouble

.2_end:
// Restore link register and return
ldp x30, x29, [sp], #16
ret
