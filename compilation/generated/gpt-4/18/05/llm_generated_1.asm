//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and the link register (x30)
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int1 > 10
cmp w0, #10
ble .int_branch

// True path: int1 * int2
mul w4, w0, w1
str w4, [x2]
b .double_check

.int_branch:
// False path: int1 + int2
add w4, w0, w1
str w4, [x2]

.double_check:
// Check if double2 < 5.0
fmov d2, #5.0
fcmp d1, d2
fccmp d1, d2, #0, lt
b.ge .double_branch

// True path: double1
fmov d3, d0
str d3, [x3]
b .end

.double_branch:
// False path: double2
str d1, [x3]

.end:
// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret
