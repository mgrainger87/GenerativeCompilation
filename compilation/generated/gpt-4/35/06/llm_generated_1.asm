//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2

_customFunction:
// Save frame pointer and link register
stp     x29, x30, [sp, -16]!
mov     x29, sp

// Compare int1 and int2
cmp     w0, w1
beq     .1_equal

// Recursive call: customFunction(int1+1, int2-1, double1, double2, outInt, outDouble)
add     w0, w0, #1          // int1 + 1
sub     w1, w1, #1          // int2 - 1

bl      _customFunction     // Recursive call

// Restore frame pointer and link register and return
ldp     x29, x30, [sp], #16
ret

.1_equal:
// *outInt = int1
str     w0, [x2]

// *outDouble = double1
str     d0, [x3]

// Restore frame pointer and link register and return
ldp     x29, x30, [sp], #16
ret
