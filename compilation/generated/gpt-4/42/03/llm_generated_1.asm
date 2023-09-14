//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiply the two double parameters
fmul d0, d0, d1

// Return the result in d0
ret
.global _customFunction
_customFunction:
// Save caller-saved registers and link register to the stack
stp x29, x30, [sp, #-16]!     // Save FP (x29) and LR (x30) to the stack
mov x29, sp                  // Set FP to the current stack pointer

// Call helperFunction to multiply double1 and double2
bl _helperFunction           // Call helperFunction

// Save the result in *outDouble
str d0, [x3]                 // Save the result to outDouble

// Subtract int1 and int2
sub w0, w0, w1               // Subtract int2 from int1

// Save the result in *outInt
str w0, [x2]                 // Save the result to outInt

// Restore caller-saved registers and return
ldp x29, x30, [sp], #16      // Pop FP and LR from the stack
ret
