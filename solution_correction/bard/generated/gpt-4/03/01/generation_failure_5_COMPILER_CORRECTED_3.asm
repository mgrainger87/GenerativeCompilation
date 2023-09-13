//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
stp x29, x30, [sp, -16]!    // save frame pointer and link register
mov x29, sp                // set up frame pointer

// Function logic
str w0, [x2]               // store int1 into *outInt
str d0, [x3]              // store double1 into *outDouble

// End of function
ldp x29, x30, [sp], 16    // restore frame pointer and link register
ret
