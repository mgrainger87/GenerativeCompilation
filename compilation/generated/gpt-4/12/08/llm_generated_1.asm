//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register to the stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Compare double1 and double2
fcmp d0, d1

// If double1 > double2, jump to greater_label
b.gt greater_label

// Else execute this block
sub w4, w0, w1             // int1 - int2
str w4, [x2]              // Store result to *outInt
fmov d3, d1               // Move double2 to d3
str d3, [x3]              // Store double2 to *outDouble
b end_function            // Jump to the end of the function

greater_label:
add w4, w0, w1             // int1 + int2
str w4, [x2]              // Store result to *outInt
fmov d3, d0               // Move double1 to d3
str d3, [x3]              // Store double1 to *outDouble

end_function:
// Restore the link register and frame pointer
ldp x30, x29, [sp], #16
ret
