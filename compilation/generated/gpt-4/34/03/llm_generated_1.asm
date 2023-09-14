//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!
mov x29, sp

fcmp d1, #0.0
ble .L1_positive_branch

// Load 0.5 into a temporary register
fmov d4, #0.5

// Adjust the parameters
add x0, x0, #1     // int1 + 1
sub x1, x1, #1     // int2 - 1
fadd d0, d0, d4    // double1 + 0.5
fsub d1, d1, d4    // double2 - 0.5

// Recursive call
bl _customFunction

// Restore lr and fp, and return
ldp x29, x30, [sp], #16
ret

.L1_positive_branch:
// *outInt = int1
str w0, [x2]

// Load the immediate value for double2 into a temporary register
fmov d4, d1

// *outDouble = double1 + double2
fadd d3, d0, d4
str d3, [x3]

// Restore lr and fp, and return
ldp x29, x30, [sp], #16
ret
