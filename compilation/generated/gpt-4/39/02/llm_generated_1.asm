//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and other callee-saved registers we might need
stp     lr, x19, [sp, #-16]!

// Check if double1 (d0) is less than 10
fmov    d19, #10.0        // Load 10.0 into d19
fcmp    d0, d19           // Compare d0 (double1) with 10.0
fccmp   d0, d19, #4, mi   // Conditionally compare if less than (mi = minus)

b.ge    1f                // Branch if greater than or equal to next local label

// If block starts here
mul     w4, w0, w1        // Multiply int1 (w0) with int2 (w1)
str     w4, [x2]          // Store result to *outInt
str     d0, [x3]          // Store double1 (d0) to *outDouble
b       2f                // Branch to function end

// Else block starts here
1:
add     w1, w1, #2        // int2 = int2 + 2

// Load floating point values into temporary registers
fmov    d20, #1.0
fsub    d0, d0, d20       // double1 = double1 - 1
fadd    d1, d1, d20       // double2 = double2 + 1

// Call the function recursively
bl      _customFunction   // Call customFunction

// Continue to function end
2:
// Restore callee-saved registers
ldp     lr, x19, [sp], #16

ret
