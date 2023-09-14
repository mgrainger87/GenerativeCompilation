//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _customFunction
.align  2
_customFunction:
// Save callee-saved registers if necessary
// (For this simple function, we don't need to save any additional registers.)

// Calculate int1 + int2 + 5
add     w4, w0, w1      // w4 = int1 + int2
add     w4, w4, #5      // w4 = w4 + 5

// Store the integer result
str     w4, [x2]

// Add the floating point values
fmov    d2, #5.0        // move 5.0 into d2
fadd    d3, d0, d1      // d3 = double1 + double2
fadd    d3, d3, d2      // d3 = d3 + 5.0

// Store the floating point result
str     d3, [x3]

// Return
ret
