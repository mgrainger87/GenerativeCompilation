//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save necessary registers (only x30 in this case)
stp x30, xzr, [sp, #-16]!  // We use xzr to save space for another register, but we won't restore it

// Compare double1 and double2
fcmp d0, d1

// If double1 > double2, branch to .Ltrue_label
b.gt .Ltrue_label

// Else branch (i.e., double1 <= double2)
sub w4, w0, w1       // Calculate int1 - int2
str w4, [x2]         // Store the result at the location pointed by outInt
fmov d2, d1         // Move double2 to v2
str d2, [x3]         // Store the result at the location pointed by outDouble
b .Lend_label       // Jump to the end of the function

.Ltrue_label:
// True branch (i.e., double1 > double2)
add w4, w0, w1       // Calculate int1 + int2
str w4, [x2]         // Store the result at the location pointed by outInt
fmov d2, d0          // Move double1 to v2
str d2, [x3]         // Store the result at the location pointed by outDouble

.Lend_label:
// Restore the saved register and return
ldp x30, xzr, [sp], #16
ret
