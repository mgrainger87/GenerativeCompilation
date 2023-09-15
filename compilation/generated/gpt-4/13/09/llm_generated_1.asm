//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp                // Set frame pointer

// Compare int1 and int2
cmp w0, w1

// If int1 is not equal to int2, jump to not_equal label
b.ne not_equal

// If int1 is equal to int2
// Multiply int1 by int2 and store the result at the memory location pointed to by outInt
mul w4, w0, w1
str w4, [x2]

// Add double1 and double2
fadd d4, d0, d1
// Store the result at the memory location pointed to by outDouble
str d4, [x3]

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret

not_equal:
// Store 0 at the memory location pointed to by outInt
mov w4, #0
str w4, [x2]

// Store 0.0 at the memory location pointed to by outDouble
fmov d4, #0.0
str d4, [x3]

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret
