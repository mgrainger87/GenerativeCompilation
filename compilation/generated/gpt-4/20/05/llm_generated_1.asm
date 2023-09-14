//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to preserve return address
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Check if int1 + int2 > 100
add     w4, w0, w1         // w4 = int1 + int2
cmp     w4, #100
b.le    .else_path

// If true: *outInt = 100 and *outDouble = double1 * double2
mov     w5, #100
str     w5, [x2]          // Store 100 to *outInt

fmul    d2, d0, d1        // Multiply double1 and double2
str     d2, [x3]          // Store result to *outDouble
b       .end_function

.else_path:
// If false: *outInt = int1 + int2 and *outDouble = double1 + double2
str     w4, [x2]          // Store int1 + int2 to *outInt

fadd    d2, d0, d1        // Add double1 and double2
str     d2, [x3]          // Store result to *outDouble

.end_function:
// Restore link register and return
ldp     x30, x29, [sp], #16
ret
