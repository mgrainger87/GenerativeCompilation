//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// The function simply assigns int1 (which is in x0) to *outInt.
// The effective address of *outInt is already in x2.

// Save callee-saved registers if we were to use any,
// but for this function, we don't use any.

// Assign x0 to the location pointed to by x2.
str w0, [x2]

// Restore callee-saved registers (none used).

// Return
ret
