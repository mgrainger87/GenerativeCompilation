//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
// Save link register to preserve return address
stp x30, x29, [sp, #-16]!  // Create stack frame: push x30 (lr) and x29 (fp)
mov x29, sp                // Update frame pointer

// Perform int1 * 3
lsl w4, w0, #1       // w4 = int1 * 2
add w4, w4, w0       // w4 = w4 + int1 = int1 * 3

// Subtract int2 from result
sub w4, w4, w1       // w4 = w4 - int2

// Store result at outInt
str w4, [x2]

// Load immediate floating point value 3.0 into d2
fmov d2, #3.0

// Perform double2 * 3
fmul d3, d1, d2     // d3 = double2 * 3

// Subtract result from double1
fsub d3, d0, d3     // d3 = double1 - d3

// Store result at outDouble
str d3, [x3]

// Restore link register
ldp x30, x29, [sp], #16  // Pop x30 (lr) and x29 (fp) from stack

ret
