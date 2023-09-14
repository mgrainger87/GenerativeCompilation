//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to stack
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Check if double1 (D0) <= 0
fcmp    d0, #0.0
ble     handle_zero_case

// Else branch: Recursive call to customFunction
// Subtract 0.5 from double1 and add 0.5 to double2
fmov    d4, #0.5
fsub    d0, d0, d4
fadd    d1, d1, d4

// Call customFunction recursively with modified arguments
// Note: int1, int2, outInt, and outDouble remain the same
bl      _customFunction

// Restore link register and return
ldp     x29, x30, [sp], #16
ret

handle_zero_case:
// *outInt = int1 + int2
add     w4, w0, w1
str     w4, [x2]

// *outDouble = double2
str     d1, [x3]

// Restore link register and return
ldp     x29, x30, [sp], #16
ret
