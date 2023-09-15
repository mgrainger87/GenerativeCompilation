//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to preserve return address
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                 // Set frame pointer

// Compare double1 to 0.0
fcmp d0, #0.0
beq .1_zero

// Else path (double1 != 0.0)
sub w4, w0, w1              // int1 - int2
str w4, [x2]               // Store result to *outInt
fmov d2, d0                // Move double1 to d2
str d2, [x3]               // Store d2 to *outDouble
b .2_end

// If path (double1 == 0.0)
.1_zero:
add w4, w0, w1              // int1 + int2
str w4, [x2]               // Store result to *outInt
fmov d2, #1.0              // Load 1.0 into d2
str d2, [x3]               // Store d2 to *outDouble

.2_end:
// Restore link register and return
ldp x29, x30, [sp], #16
ret
