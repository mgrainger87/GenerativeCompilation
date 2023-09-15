//compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
.globl _customFunction
.align  2

// helperFunction:
_helperFunction:
add     w0, w0, w1       // w0 = a + b
ret

// customFunction:
_customFunction:
// Save the link register
str     lr, [sp, #-16]!

// Call helperFunction to get the sum of int1 and int2
bl      _helperFunction

// Store the result to *outInt
str     w0, [x2]

// Add the two floating-point numbers
fadd    d0, d0, d1

// Store the result to *outDouble
str     d0, [x3]

// Restore the link register and return
ldr     lr, [sp], #16
ret
