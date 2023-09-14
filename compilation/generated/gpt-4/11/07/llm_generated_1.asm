//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Compare int1 and int2
cmp w0, w1

// If int1 is greater, save int1 and double1, else save int2 and double2
b.le 1f

// Store int1 and double1 to outInt and outDouble
str w0, [x2]
str d0, [x3]
b 2f

1:
// Store int2 and double2 to outInt and outDouble
str w1, [x2]
str d1, [x3]

2:
// Restore stack and link register, then return
ldp x30, x29, [sp], #16
ret
