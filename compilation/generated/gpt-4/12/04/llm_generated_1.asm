//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!     // Save frame pointer and link register to the stack
mov x29, sp                   // Set up frame pointer for this function

// Compare double1 and double2
fcmp d0, d1

// If double1 > double2, store int1 + int2 in *outInt and double1 in *outDouble
b.le .else_block
add w4, w0, w1                // w4 = int1 + int2
str w4, [x2]                 // Store result in *outInt
fmov d2, d0                  // Move double1 to d2
str d2, [x3]                 // Store double1 in *outDouble
b .end_function

.else_block:
// Store int1 - int2 in *outInt and double2 in *outDouble
sub w4, w0, w1                // w4 = int1 - int2
str w4, [x2]                 // Store result in *outInt
fmov d2, d1                  // Move double2 to d2
str d2, [x3]                 // Store double2 in *outDouble

.end_function:
// Epilogue
ldp x29, x30, [sp], #16      // Restore frame pointer and link register
ret                          // Return to caller
