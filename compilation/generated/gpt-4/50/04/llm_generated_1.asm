//compiler_errors=2,linker_errors=0,execution_errors=1,correctness_errors=0
_helperFunction:
// Add 10 to x0 and return the result in x0.
add x0, x0, #10
ret
.global _customFunction
_customFunction:
// Preserve the link register (lr) before making the function call.
str lr, [sp, #-16]!  // Push lr onto the stack and update the stack pointer.

// Call helperFunction using the int1 parameter (x0).
bl _helperFunction  // After this call, x0 will contain the result of helperFunction(int1).

// Load the result into the memory address pointed to by outInt (x2).
str x0, [x2]

// Store the value of double2 (d1) into the memory address pointed to by outDouble (x3).
str d1, [x3]

// Restore the link register.
ldr lr, [sp], #16  // Pop lr off the stack and update the stack pointer.

ret
