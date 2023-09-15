//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Adjust stack to save link register
sub sp, sp, #16

// Save link register to stack
str lr, [sp]

// Compute int1 * int1
mul w4, w0, w0        // w4 = int1 * int1

// Dereference outInt and store result
str w4, [x2]

// Compute double2 * double2
fmul d4, d1, d1       // d4 = double2 * double2

// Dereference outDouble and store result
str d4, [x3]

// Restore link register
ldr lr, [sp]

// Adjust stack back
add sp, sp, #16

// Return
ret
