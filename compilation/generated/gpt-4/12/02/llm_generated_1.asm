//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store the link register to preserve it
stp x30, x29, [sp, #-16]!   // Create stack frame
mov x29, sp                 // Update frame pointer

// Compare double1 and double2
fcmp d0, d1

// If double1 > double2, jump to the greater label
b.gt .1_greater

.2_less_equal:
// Code for double1 <= double2
sub w4, w0, w1               // int1 - int2
str w4, [x2]                // Store result to outInt
fmov d2, d1                 // Move double2 to d2
str d2, [x3]                // Store double2 to outDouble
b .3_end                    // Jump to end

.1_greater:
// Code for double1 > double2
add w4, w0, w1               // int1 + int2
str w4, [x2]                // Store result to outInt
fmov d2, d0                 // Move double1 to d2
str d2, [x3]                // Store double1 to outDouble

.3_end:
// Restore link register and return
ldp x30, x29, [sp], #16
ret
