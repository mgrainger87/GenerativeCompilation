//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save necessary registers
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp               // Set up frame pointer for this function

// Check if int1 > 10
cmp w0, #10               // Compare int1 (x0) with 10
b.le 1f                   // If less than or equal, branch to label 1

// If int1 > 10: *outInt = int1 * int2
mul w4, w0, w1            // w4 = int1 * int2
str w4, [x2]              // Store result in outInt
b 2f                      // Branch to label 2

1:  // Else: *outInt = int1 + int2
add w4, w0, w1            // w4 = int1 + int2
str w4, [x2]              // Store result in outInt

2:  // Check if double2 < 5.0
fmov d2, #5.0             // Load 5.0 into d2
fcmp d1, d2               // Compare double2 (d1) with 5.0
b.ge 3f                   // If greater than or equal, branch to label 3

// If double2 < 5.0: *outDouble = double1
str d0, [x3]              // Store double1 in outDouble
b 4f                      // Branch to label 4

3:  // Else: *outDouble = double2
str d1, [x3]              // Store double2 in outDouble

4:  // Epilogue: Restore saved registers and return
ldp x29, x30, [sp], #16   // Restore frame pointer and link register
ret                       // Return
