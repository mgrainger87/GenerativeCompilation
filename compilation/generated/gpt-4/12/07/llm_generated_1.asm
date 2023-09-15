//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align  2
_customFunction:
// Save link register
str     lr, [sp, #-16]!

// Compare double1 and double2
fcmp    d0, d1

// Conditional branching based on the comparison result
b.gt    .1_greater_than_label

.0_else_label:
// Execute the else block
// Calculate int1 - int2
sub     w4, w0, w1

// Store result to *outInt
str     w4, [x2]

// Store double2 to *outDouble
fmov    d5, d1
str     d5, [x3]

// Restore link register and return
ldr     lr, [sp], #16
ret

.1_greater_than_label:
// Execute the if block
// Calculate int1 + int2
add     w4, w0, w1

// Store result to *outInt
str     w4, [x2]

// Store double1 to *outDouble
fmov    d5, d0
str     d5, [x3]

// Restore link register and return
ldr     lr, [sp], #16
ret
