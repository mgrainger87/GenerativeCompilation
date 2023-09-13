//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.text
.p2align 4
_customFunction:
stp x29, x30, [sp, #-16]!   // Save frame pointer and return address
mov x29, sp                 // Set up frame pointer

str x0, [x2]                // *outInt = int1; Store int1 to the memory pointed by outInt
str d0, [x3]                // *outDouble = double1; Store double1 to the memory pointed by outDouble

ldp x29, x30, [sp], #16     // Restore frame pointer and return address
ret                         // Return
