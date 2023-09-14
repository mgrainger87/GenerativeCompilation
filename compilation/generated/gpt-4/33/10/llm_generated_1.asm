//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 3
_customFunction:
// Save link register to preserve return address.
stp x29, x30, [sp, #-16]!
mov x29, sp

// Load floating point literals.
fmov d4, #0.0
fmov d5, #0.5

// Compare double1 (in d0) with 0.0.
fcmp d0, d4

// If double1 <= 0, jump to lessOrEqual label.
ble 1f

// Recursive call if double1 > 0.
// Update double1 and double2.
fsub d0, d0, d5
fadd d1, d1, d5

// Perform the recursive call.
bl _customFunction

// Restore link register.
ldp x29, x30, [sp], #16
ret

1:  // double1 <= 0 logic.
// *outInt = int1 + int2;
add w4, w0, w1
str w4, [x2]

// *outDouble = double2;
str d1, [x3]

// Restore link register.
ldp x29, x30, [sp], #16
ret
