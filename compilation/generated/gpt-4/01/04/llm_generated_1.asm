//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2

_customFunction:
// Save link register (return address)
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Add integers and store the result to *outInt
add     w4, w0, w1          // w4 = int1 + int2
str     w4, [x2]            // *outInt = w4

// Load immediate values for floating point addition
fadd    d2, d0, d1          // d2 = double1 + double2
str     d2, [x3]            // *outDouble = d2

// Restore link register and return
ldp     x30, x29, [sp], #16
ret
