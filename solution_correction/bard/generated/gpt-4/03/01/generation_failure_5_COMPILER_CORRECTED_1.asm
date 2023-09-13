//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction            // Mangled the function name using Clang convention for C
.align 2                           // Alignment for arm64

_customFunction:
stp x29, x30, [sp, -32]!       // Save frame pointer and return address onto the stack. Increase stack size by 32 bytes.
mov x29, sp                    // Set up frame pointer

// Store the input values to their respective output addresses
str w0, [x2]                   // *outInt = int1;
str d0, [x3]                   // *outDouble = double1;

// Restore the saved registers and return
ldp x29, x30, [sp], 32         // Pop the saved frame pointer and return address from the stack.
ret
