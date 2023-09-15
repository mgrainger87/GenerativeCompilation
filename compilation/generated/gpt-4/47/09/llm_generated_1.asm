//compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=1
.global _helperFunction
_helperFunction:
fneg d0, d0      // Negate the value of d0 and store the result back in d0
ret              // Return with the result in d0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!    // Store frame pointer and link register to the stack (prolog)
mov x29, sp                  // Set frame pointer

str w0, [x2]                 // Store the value of w0 (int1) to the memory address pointed to by x2 (outInt)

fmov d0, d1                  // Move value from d1 (double2) to d0
bl _helperFunction           // Call helperFunction
str d0, [x3]                 // Store the returned value (negative of double2) to the memory address pointed to by x3 (outDouble)

ldp x29, x30, [sp], #16      // Restore frame pointer and link register (epilog)
ret
