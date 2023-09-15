//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save frame pointer and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare int1 and int2
cmp w0, w1

// If not equal, branch to else label
b.ne 1f

// Multiply int1 and int2 and store in outInt
mul w4, w0, w1
str w4, [x2]

// Load immediate floating point values into floating point registers
fadd d3, d0, d1
str d3, [x3]

b 2f

1:
// Set outInt to 0
mov w4, #0
str w4, [x2]

// Set outDouble to 0.0
fmov d3, #0.0
str d3, [x3]

2:
// Restore frame pointer and link register and return
ldp x29, x30, [sp], #16
ret
