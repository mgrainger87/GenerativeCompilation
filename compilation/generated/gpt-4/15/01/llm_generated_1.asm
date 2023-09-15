//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and frame pointer
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if double1 (d0) is 0.0
fmov d2, #0.0
fcmp d0, d2
b.eq .if_true

.if_true:
// *outInt = int1 + int2;
add w4, w0, w1
str w4, [x2]

// *outDouble = 1.0;
fmov d3, #1.0
str d3, [x3]
b .end

.if_false:
// *outInt = int1 - int2;
sub w4, w0, w1
str w4, [x2]

// *outDouble = double1;
str d0, [x3]

.end:
// Restore link register and frame pointer
ldp x29, x30, [sp], #16
ret
