//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2
_customFunction:
// Save LR to the stack for later restoration
stp     x30, xzr, [sp, #-16]!  // push {x30, xzr} to the stack and update SP

// Compute int1 - int2
sub     w4, w0, w1             // w4 = w0 - w1

// Store the result to *outInt
str     w4, [x2]

// Load double1 and double2 into floating point registers
fmov    d2, d0
fmov    d3, d1

// Compute double1 - double2
fsub    d4, d2, d3

// Store the result to *outDouble
str     d4, [x3]

// Restore LR from the stack
ldp     x30, xzr, [sp], #16   // pop {x30, xzr} from the stack and update SP

// Return
ret
