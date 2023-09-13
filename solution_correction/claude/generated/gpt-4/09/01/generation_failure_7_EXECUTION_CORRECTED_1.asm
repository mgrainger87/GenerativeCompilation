//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.p2align 2
_customFunction:
stp x29, x30, [sp, #-16]!     // Store x29 and x30 to the stack
mov x29, sp                  // Update frame pointer

str w0, [x2]                 // *outInt = int1
str d0, [x3]                 // *outDouble = double1

ldp x29, x30, [sp], #16      // Load x29 and x30 from the stack and update stack pointer
ret                          // Return
