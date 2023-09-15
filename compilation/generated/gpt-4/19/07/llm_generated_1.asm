//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int2 % 3 == 0
mov w4, #3
udiv w5, w1, w4
msub w6, w5, w4, w1

cmp w6, #0
b.ne 1f

// If int2 % 3 == 0, then outInt = int1 * int1
mul w7, w0, w0
str w7, [x2]
b 2f

1:
// If int2 % 3 != 0, then outInt = int2 * int2
mul w8, w1, w1
str w8, [x2]

2:
// Check if double1 == double2
fcmp d0, d1
b.eq 3f

// If double1 != double2, then outDouble = double1 + double2
fadd d3, d0, d1
str d3, [x3]
b 4f

3:
// If double1 == double2, then outDouble = 0.0
fmov d4, #0.0
str d4, [x3]

4:
// Restore the link register and return
ldp x29, x30, [sp], #16
ret
