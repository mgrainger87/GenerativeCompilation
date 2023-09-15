//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save callee-saved registers and link register (x30)
stp x29, x30, [sp, #-16]! // Save frame pointer and link register
mov x29, sp // Set frame pointer

// Load floating point constants
fmov d3, #1.0

// Check if int2 (x1) < 5
cmp w1, #5
blt .Lif_branch

// Else branch
sub w1, w1, #2 // int2 = int2 - 2
fsub d1, d1, d3 // double2 = double2 - 1.0
bl _customFunction
// Restore frame pointer and link register
ldp x29, x30, [sp], #16
ret

.Lif_branch:
// int2 < 5 branch
str w0, [x2] // *outInt = int1
fadd d2, d0, d1 // d2 = double1 + double2
str d2, [x3] // *outDouble = d2
// Restore frame pointer and link register
ldp x29, x30, [sp], #16
ret
