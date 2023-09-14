//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
.global _customFunction

// Align symbol for arm64
.align 2

_helperFunction:
// Multiply the two doubles
fmul d0, d0, d1
ret

// Align symbol for arm64
.align 2

_customFunction:
// We need to preserve the link register before branching
stp x29, x30, [sp, #-16]!  // Save FP and LR to the stack
mov x29, sp               // Set up frame pointer for this function

// Call the helper function
bl _helperFunction

// Store the result of helperFunction (which is in d0) to *outDouble
str d0, [x3]

// Subtract int1 and int2, and store the result in *outInt
sub w0, w0, w1  // Subtract the integers (using 32-bit registers, as mentioned)
str w0, [x2]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
