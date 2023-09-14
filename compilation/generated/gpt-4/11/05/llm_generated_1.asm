//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to preserve return address
str     lr, [sp, #-16]!

// Compare int1 (x0) with int2 (x1)
cmp     w0, w1

// If int1 > int2, take the "then" branch, else "else" branch
b.gt    1f

// "else" block
str     w1, [x2]       // Store int2 to *outInt
str     d1, [x3]       // Store double2 to *outDouble
b       2f             // Jump to function epilogue

1:  // "then" block
str     w0, [x2]       // Store int1 to *outInt
str     d0, [x3]       // Store double1 to *outDouble

2:  // Function epilogue
ldr     lr, [sp], #16  // Restore link register
ret                    // Return to caller
