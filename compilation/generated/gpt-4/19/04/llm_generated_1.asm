//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register (return address)
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compute int2 % 3
mov w4, #3            // w4 = 3
udiv w5, w1, w4       // w5 = int2 / 3
msub w5, w5, w4, w1   // w5 = int2 - w5 * 3

// Branch based on the result
cmp w5, #0
bne .not_divisible_by_3

// int2 % 3 == 0, so square int1
mul w5, w0, w0
str w5, [x2]
b .double_comparison

.not_divisible_by_3:
// Square int2
mul w5, w1, w1
str w5, [x2]

.double_comparison:
// Compare double1 and double2
fcmp d0, d1
beq .equal_doubles

// double1 + double2
fadd d4, d0, d1
str d4, [x3]
b .end_function

.equal_doubles:
// Store 0.0 into *outDouble
fmov d4, #0.0
str d4, [x3]

.end_function:
// Restore the link register and return
ldp x29, x30, [sp], #16
ret
