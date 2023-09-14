//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and other callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Calculate sum of int1 and int2
add w4, w0, w1

// Compare the result with 100
cmp w4, #100

// If int1 + int2 > 100, then set the values and branch to end
b.gt .greater_than_100

// Else part: int1 + int2 <= 100
str w4, [x2]        // Store the sum to *outInt
fadd d2, d0, d1    // Add double1 and double2
str d2, [x3]       // Store the result to *outDouble
b .end

.greater_than_100:
mov w4, #100
str w4, [x2]       // Store 100 to *outInt
fmul d2, d0, d1    // Multiply double1 and double2
str d2, [x3]       // Store the result to *outDouble

.end:
// Restore link register and other callee-saved registers
ldp x29, x30, [sp], #16
ret
