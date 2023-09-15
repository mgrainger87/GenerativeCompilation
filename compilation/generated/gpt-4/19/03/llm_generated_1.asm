//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save link register to preserve return address
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int2 % 3 == 0
mov w4, #3
sdiv w5, w1, w4
mul w5, w5, w4
sub w5, w1, w5

// Set *outInt based on the result
cbz w5, .int2_mod_3_zero
mul w4, w1, w1
str w4, [x2]
b .double_check

.int2_mod_3_zero:
mul w4, w0, w0
str w4, [x2]

.double_check:
// Check if double1 == double2
fcmp d0, d1
beq .doubles_equal

// Set *outDouble if double1 != double2
fadd d3, d0, d1
str d3, [x3]
b .end_function

.doubles_equal:
fmov d3, #0.0
str d3, [x3]

.end_function:
// Restore link register and return
ldp x29, x30, [sp], #16
ret
