//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int1 is negative
cmp w0, #0
bge .Lpositive_int1

// If negative, negate int1
neg w0, w0

.Lpositive_int1:
// Store the absolute value of int1 to *outInt
str w0, [x2]

// Check if double2 is negative
fcmp d1, #0.0
bge .Lpositive_double2

// If negative, negate double2
fneg d1, d1

.Lpositive_double2:
// Store the absolute value of double2 to *outDouble
str d1, [x3]

// Epilogue: Restore the link register and return
ldp x29, x30, [sp], #16
ret
