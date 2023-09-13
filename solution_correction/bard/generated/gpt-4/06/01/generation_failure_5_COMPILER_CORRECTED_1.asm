//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x19, x20, [sp, #-16]!    // Save callee-saved registers. Though, in this function, they are unnecessary.

mov x19, x0                  // Move int1 to x19 for later use
mov x20, x1                  // Move int2 to x20 (even though we don't use int2)

str w19, [x2]                // Store value of int1 (from x19) to the memory location pointed by outInt
str d0, [x3]                 // Store value of double1 to the memory location pointed by outDouble

ldp x19, x20, [sp], #16      // Restore callee-saved registers. Again, this is not really needed for the function logic, but it adheres to the standard.
ret
