//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!    // save frame and link registers
mov x29, sp                  // set up frame pointer

str x0, [x2]                 // store int1 to *outInt
str d0, [x3]                // store double1 to *outDouble

ldp x29, x30, [sp], #16     // restore frame and link registers
ret                         // return
