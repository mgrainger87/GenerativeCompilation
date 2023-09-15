//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Compare double1 with double2
fcmp d0, d1

// If double1 <= double2, jump to else_case
ble .Lelse_case

// Execute if double1 > double2
add w4, w0, w1       // int1 + int2
str w4, [x2]         // Store result to outInt
fmov d2, d0          // double1
str d2, [x3]         // Store result to outDouble
ret

.Lelse_case:
sub w4, w0, w1       // int1 - int2
str w4, [x2]         // Store result to outInt
fmov d2, d1          // double2
str d2, [x3]         // Store result to outDouble
ret
