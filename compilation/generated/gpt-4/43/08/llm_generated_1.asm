//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

.text
.align 2

_helperFunction:
fmul d0, d0, d0      // multiply a by itself and store the result in d0
ret                 // return

_customFunction:
stp x29, x30, [sp, #-16]!  // save frame pointer and link register
mov x29, sp               // set frame pointer

// *outInt = int1
str w0, [x2]

// *outDouble = helperFunction(double1)
bl _helperFunction        // call helperFunction
str d0, [x3]              // store the result to *outDouble

ldp x29, x30, [sp], #16   // restore frame pointer and link register
ret                       // return
