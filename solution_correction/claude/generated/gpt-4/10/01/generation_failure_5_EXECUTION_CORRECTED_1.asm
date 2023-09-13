//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2
_customFunction:
stp     x29, x30, [sp,#-16]!    // Store x29 and x30 on the stack
mov     x29, sp                // Set x29 as the frame pointer

str     w0, [x2]               // Store int1 in the address pointed by outInt
str     d0, [x3]               // Store double1 in the address pointed by outDouble

ldp     x29, x30, [sp],#16     // Restore x29 and x30 from the stack
ret                            // Return
