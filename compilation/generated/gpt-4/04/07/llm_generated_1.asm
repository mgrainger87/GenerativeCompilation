//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register onto the stack
// We don't make a function call here, but it's good practice in case the function changes in future.
stp     lr, xzr, [sp, #-16]!  // Using xzr to not actually store a second register's value

// Store int1 to *outInt
str     w0, [x2]

// Store double2 to *outDouble
str     d1, [x3]

// Restore the link register
ldp     lr, xzr, [sp], #16

ret
