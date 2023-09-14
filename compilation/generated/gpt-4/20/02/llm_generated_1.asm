//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// Save frame pointer and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Calculate int1 + int2
add w4, w0, w1  // w4 will hold the result of int1 + int2

// Compare w4 with 100
cmp w4, #100

// Branch based on comparison
b.le .Lelse

.Lif:
// *outInt = 100
mov w5, #100
str w5, [x2]

// *outDouble = double1 * double2
fmul d2, d0, d1
str d2, [x3]

b .Lend

.Lelse:
// *outInt = int1 + int2
str w4, [x2]

// *outDouble = double1 + double2
fadd d2, d0, d1
str d2, [x3]

.Lend:
// Restore frame pointer and link register and return
ldp x29, x30, [sp], #16
ret
