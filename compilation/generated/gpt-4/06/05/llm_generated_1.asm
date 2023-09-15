//compiler_errors=0,linker_errors=0,execution_errors=2,correctness_errors=0
.global _customFunction
_customFunction:
// Store the link register and x4 register to the stack (16-byte alignment)
stp     lr, x4, [sp, #-16]!

// *outInt = int1 + int2 * 2;
lsl     w4, w1, #1        // Multiply int2 by 2 and store the result in w4
add     w4, w4, w0        // Add w4 (int2*2) to int1
str     w4, [x2]          // Store the result in *outInt

// Load immediate value 2.0 into d2
mov     x4, 0x4000000000000000 // Bit pattern for double value 2.0
fmov    d2, x4            // Move the bit pattern from x4 into d2 as a double

fmul    d2, d0, d2        // Multiply double1 by 2.0
fadd    d2, d2, d1        // Add the result to double2
str     d2, [x3]          // Store the result in *outDouble

// Restore the x4 and link register from the stack and return
ldp     lr, x4, [sp], #16
ret
