//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
.global _helperFunction
_helperFunction:
fneg d0, d0  ; negate the value in d0
ret          ; return
.global _customFunction
_customFunction:
// Saving link register to the stack
stp x30, xzr, [sp, #-16]!  ; push x30 (link register) and xzr (just to align the stack)

// Task 1: Set *outInt to int1
str w0, [x2]  ; store the value in x0 (int1) to the address in x2 (outInt)

// Prepare for Task 2: Move double2 (d1) to d0 for helperFunction
fmov d0, d1

// Call helperFunction for double2
bl _helperFunction  ; call helperFunction. Now, double2 is correctly placed in d0.

// Store the result (now in d0) to outDouble
str d0, [x3]

// Restore link register
ldp x30, xzr, [sp], #16  ; pop x30 and xzr off the stack

ret
