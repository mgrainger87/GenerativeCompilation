//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save frame and link register
stp x29, x30, [sp, -16]!
mov x29, sp

// Compare double1 with 10
fmov d2, #10.0
fcmp d0, d2

// Branch if double1 < 10
blt .lessThan10

// Else branch: prepare for recursive call
add x1, x1, #2
fmov d3, #1.0
fsub d0, d0, d3
fadd d1, d1, d3
bl _customFunction
b .end

.lessThan10:
// Compute int1 * int2 and store the result at *outInt
mul w4, w0, w1
str w4, [x2]

// Store double1 at *outDouble
str d0, [x3]

.end:
// Restore frame and link register and return
ldp x29, x30, [sp], #16
ret
