//compiler_errors=2,linker_errors=1,execution_errors=0,correctness_errors=0
.align  2
.globl  _customFunction
_customFunction:
// Save link register and required callee-saved registers
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Check the condition (int2 < 5)
cmp     w1, #5
blt     .LessThan5

// Else part (Recursive call)
sub     w1, w1, #2       // int2 = int2 - 2

// Load 1.0 directly into d4
fmov    d4, #1.0

// Subtract d4 (1.0) from double2
fsub    d1, d1, d4

bl      _customFunction  // Recursive call
ldp     x29, x30, [sp], #16  // Restore registers
ret

.LessThan5:
.align  2  // Ensure alignment for the local label too
// *outInt = int1
str     w0, [x2]

// *outDouble = double1 + double2
fadd    d4, d0, d1
str     d4, [x3]

ldp     x29, x30, [sp], #16  // Restore registers
ret
