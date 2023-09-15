//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Prologue: Set up the stack frame
stp x29, x30, [sp, #-16]! // Store frame pointer and link register
mov x29, sp               // Set the frame pointer to the current stack pointer

// Check if int1 (x0) is less than 0
cmp w0, #0                // Compare int1 with 0
bge .int1_non_negative    // Branch if int1 is greater than or equal to 0

// Negative branch for int1
neg w0, w0                // Negate int1
str w0, [x2]              // Store the negated value in *outInt
b .double2_check          // Jump to check for double2

.int1_non_negative:
str w0, [x2]              // Store int1 as is in *outInt

.double2_check:
// Check if double2 (d1) is less than 0.0
fmov d2, #0.0             // Load immediate 0.0 to d2
fcmp d1, d2               // Compare double2 with 0.0
bge .double2_non_negative // Branch if double2 is greater than or equal to 0.0

// Negative branch for double2
fneg d1, d1               // Negate double2
str d1, [x3]              // Store the negated value in *outDouble
b .end                    // Jump to the end

.double2_non_negative:
str d1, [x3]              // Store double2 as is in *outDouble

.end:
// Epilogue: Restore the stack frame and return
ldp x29, x30, [sp], #16   // Restore frame pointer and link register
ret                       // Return to the caller
