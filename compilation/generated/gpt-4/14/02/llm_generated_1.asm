//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Function prologue: save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Check if int1 (x0) is negative
cmp w0, #0
b.ge .int_positive

// int1 is negative: negate int1 and store to *outInt
neg w0, w0
str w0, [x2]
b .double_check

.int_positive:
// int1 is positive: store int1 to *outInt
str w0, [x2]

.double_check:
// Check if double2 (d1) is negative
fcmp d1, #0.0
b.ge .double_positive

// double2 is negative: negate double2 and store to *outDouble
fneg d1, d1
str d1, [x3]
b .function_end

.double_positive:
// double2 is positive: store double2 to *outDouble
str d1, [x3]

.function_end:
// Function epilogue: restore the link register and return
ldp x30, x29, [sp], #16
ret
