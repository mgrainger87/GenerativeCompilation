//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
// Since this function is static, we don't need to mark it as global.
_helperFunction:
// Multiply the input double by itself.
fmul d0, d0, d0
// Return from the function. The result is already in d0 as per calling convention.
ret
.global _customFunction
_customFunction:
// Save the link register to the stack.
stp x30, x29, [sp, #-16]!
mov x29, sp

// Store int1 to outInt.
str w0, [x2]

// Call helperFunction for double1.
bl _helperFunction

// Store the result to outDouble.
str d0, [x3]

// Restore the link register from the stack and return.
ldp x30, x29, [sp], #16
ret
