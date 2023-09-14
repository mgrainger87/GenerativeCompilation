//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Calculate int1 + int2
add w4, w0, w1

// Compare the result with 100
cmp w4, #100
b.le .less_than_or_equal_100

.greater_than_100:
// For *outInt = 100;
mov w5, #100
str w5, [x2]

// For *outDouble = double1 * double2;
fmul d2, d0, d1
str d2, [x3]
b .end

.less_than_or_equal_100:
// For *outInt = int1 + int2;
str w4, [x2]

// For *outDouble = double1 + double2;
fadd d2, d0, d1
str d2, [x3]
b .end

.end:
// Restore link register and return
ldp x29, x30, [sp], #16
ret
