//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save link register to preserve return address
str lr, [sp, #-16]!  // Pre-decrement stack to make space for lr

// Multiply the integers: int1 * int2
mul w4, w0, w1  // Result in w4

// Store the result at the location pointed by outInt
str w4, [x2]

// Multiply the doubles: double1 * double2
fmul d4, d0, d1  // Result in d4

// Store the result at the location pointed by outDouble
str d4, [x3]

// Restore link register and return
ldr lr, [sp], #16  // Post-increment stack to restore original SP
ret
