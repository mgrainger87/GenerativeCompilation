//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to the stack to preserve return address
str     lr, [sp, #-16]!  // Pre-decrement stack by 16 bytes and store lr

// Check if int2 (w1) is less than 0
cmp     w1, #0
b.ge    .Lnot_negative  // Branch if greater than or equal to 0

// If int2 is negative, *outInt = int1
str     w0, [x2]        // Store w0 (int1) to *outInt
b       .Lend_int       // Branch to end of integer handling

.Lnot_negative:
// If int2 is not negative, *outInt = int2
str     w1, [x2]        // Store w1 (int2) to *outInt

.Lend_int:
// Check if double1 (d0) is greater than double2 (d1)
fcmp    d0, d1
b.le    .Lnot_greater   // Branch if less than or equal

// If double1 is greater, *outDouble = double1
str     d0, [x3]        // Store d0 (double1) to *outDouble
b       .Lend_double    // Branch to end of double handling

.Lnot_greater:
// If double1 is not greater, *outDouble = double2
str     d1, [x3]        // Store d1 (double2) to *outDouble

.Lend_double:
// Restore link register from the stack
ldr     lr, [sp], #16   // Load lr and post-increment stack by 16 bytes

ret     // Return to caller
