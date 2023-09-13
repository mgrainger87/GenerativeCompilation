//compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

.align 3

_customFunction:
stp x19, x20, [sp, #-16]!    // Save x19 and x20 to the stack to preserve them

nop                          // No operation (can be omitted)

str x0, [x2]                 // Store int1 into *outInt

str d0, [x3]                 // Store double1 into *outDouble

ldp x19, x20, [sp], #16     // Restore x19 and x20 from the stack

ret                          // Return from the function
