//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align  2
_customFunction:
// Save link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if double2 (in d1) <= 0
fcmp d1, #0.0

// Use conditional branch to handle the two cases
ble L1 // If condition met, go to label L1

// Else part for recursion:
add w0, w0, #1         // int1 + 1
sub w1, w1, #1         // int2 - 1
fmov d4, #0.5          // Move 0.5 to d4
fadd d0, d0, d4        // double1 + 0.5
fsub d1, d1, d4        // double2 - 0.5
bl _customFunction     // Recursive call

// Restore link register and return
ldp x29, x30, [sp], #16
ret

// If part:
L1:
str w0, [x2]           // *outInt = int1
fadd d0, d0, d1        // double1 + double2
str d0, [x3]           // *outDouble = result

// Restore link register and return
ldp x29, x30, [sp], #16
ret
