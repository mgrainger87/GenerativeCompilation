//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register (return address)
stp     lr, x29, [sp, #-16]!   // Push lr and frame pointer to the stack
mov     x29, sp               // Set the frame pointer

// Check if int1 is less than 0
cmp     w0, #0
b.ge    .int_positive          // Branch if int1 is >= 0

// If int1 is negative, negate it
neg     w0, w0
str     w0, [x2]              // Store result to *outInt
b       .double_check         // Jump to double check

.int_positive:
str     w0, [x2]              // Store int1 to *outInt

.double_check:
// Check if double2 is less than 0.0
fcmp    d1, #0.0
b.ge    .double_positive      // Branch if double2 is >= 0.0

// If double2 is negative, negate it
fneg    d1, d1
str     d1, [x3]              // Store result to *outDouble
b       .end_function         // Jump to function end

.double_positive:
str     d1, [x3]              // Store double2 to *outDouble

.end_function:
// Restore the link register and frame pointer
ldp     lr, x29, [sp], #16
ret                           // Return to caller
