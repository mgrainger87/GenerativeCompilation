//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Compare double1 to 0.0. We need to load 0.0 into a floating-point register first.
fmov d2, #0.0
fcmp d0, d2

// If double1 == 0.0, execute the branch
beq .1_equal_zero

// Else part: *outInt = int1 - int2
sub w4, w0, w1
str w4, [x2]

// *outDouble = double1
fmov d3, d0
str d3, [x3]

b .2_end

.1_equal_zero:
// *outInt = int1 + int2
add w4, w0, w1
str w4, [x2]

// *outDouble = 1.0
fmov d3, #1.0
str d3, [x3]

.2_end:
// Restore the link register and return
ldp x30, x29, [sp], #16
ret
