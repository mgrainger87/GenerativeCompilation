//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Input: a in d0
// Multiply the number with itself
fmul    d0, d0, d0
ret
.global _customFunction
_customFunction:
// Store the link register (x30) and the frame pointer (x29)
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// *outInt = int1;
str     w0, [x2]

// Call the helper function for double1
bl      _helperFunction

// Store the result in *outDouble
str     d0, [x3]

// Restore the link register and the frame pointer
ldp     x29, x30, [sp], #16
ret
