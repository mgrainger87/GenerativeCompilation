//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if double1 (d0) <= 0
fcmp d0, #0.0

// If double1 is not less or equal to zero, branch to recursive_call
b.gt recursive_call

// *outInt = int1 + int2;
add w4, w0, w1
str w4, [x2]

// *outDouble = double2;
fmov d4, d1
str d4, [x3]

// Restore link register and return
ldp x29, x30, [sp], #16
ret

recursive_call:
// Load floating point constants
fmov d4, #0.5

// Adjust double1 and double2 for the recursive call
fsub d0, d0, d4
fadd d1, d1, d4

// Save registers that need to be preserved across function calls
stp x0, x1, [sp, #-16]!
stp x2, x3, [sp, #-16]!
stp d0, d1, [sp, #-16]!

// Recursive function call
bl _customFunction

// Restore registers
ldp d0, d1, [sp], #16
ldp x2, x3, [sp], #16
ldp x0, x1, [sp], #16

// Restore link register and return
ldp x29, x30, [sp], #16
ret
