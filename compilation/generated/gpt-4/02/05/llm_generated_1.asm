//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// Save the link register (return address) onto the stack
stp x30, x29, [sp, #-16]!  // Pre-decrement stack pointer by 16 bytes (2 x 64-bit registers)
mov x29, sp               // Set frame pointer

// Perform int1 - int2
sub w4, w0, w1            // w4 = int1 - int2

// Store the result at the address in x2
str w4, [x2]

// Perform double1 - double2
fsub d2, d0, d1           // d2 = double1 - double2

// Store the result at the address in x3
str d2, [x3]

// Restore the link register and frame pointer, then return
ldp x30, x29, [sp], #16   // Post-increment stack pointer by 16 bytes
ret
