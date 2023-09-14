//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and other callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if double1 <= 0. Load 0 into a floating point register.
fmov d2, #0.0
fcmp d0, d2
ble .handleLessThanOrEqual0

// Load 0.5 into d4 for calculations
fmov d4, #0.5

// If double1 > 0, call the function recursively with modified parameters.
fsub d2, d0, d4
fadd d3, d1, d4
bl _customFunction
b .endFunction

.handleLessThanOrEqual0:
// *outInt = int1 + int2;
add w4, w0, w1
str w4, [x2]

// *outDouble = double2;
str d1, [x3]

.endFunction:
// Restore link register and other callee-saved registers, then return
ldp x29, x30, [sp], #16
ret
