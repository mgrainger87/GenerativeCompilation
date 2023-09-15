//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2
_customFunction:
// Save the link register (caller's address)
sub     sp, sp, #16      // allocate space on the stack
str     lr, [sp]         // store the link register onto the stack

// Integer addition
add     w4, w0, w1      // w4 = int1 + int2
add     w4, w4, #5      // w4 = w4 + 5
str     w4, [x2]        // *outInt = w4

// Floating point addition
fadd    d2, d0, d1      // d2 = double1 + double2
fmov    d3, #5.0        // load 5.0 into d3
fadd    d2, d2, d3      // d2 = d2 + 5.0
str     d2, [x3]        // *outDouble = d2

// Restore the link register
ldr     lr, [sp]        // load the link register from the stack
add     sp, sp, #16     // deallocate space on the stack

// Return
ret
