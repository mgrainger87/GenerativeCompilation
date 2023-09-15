//compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
.global _helperFunction
.global _customFunction

.text

.align 3
_helperFunction:
fneg d0, d0       ; Negate the value in d0 and store the result in d0
ret               ; Return from the function

.align 3
_customFunction:
str w0, [x2]      ; Store the value in w0 (int1) to the address pointed by x2 (outInt)
fmov d0, d1       ; Move the value in d1 (double2) to d0

// Save the link register (x30) to the stack
stp x30, xzr, [sp, #-16]!

bl _helperFunction; Call helperFunction

// Restore the link register (x30) from the stack
ldp x30, xzr, [sp], #16

str d0, [x3]      ; Store the result from helperFunction in the address pointed by x3 (outDouble)
ret               ; Return from the function
