//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, -16]!    // Save frame pointer and link register
mov x29, sp                 // Update frame pointer

// Check if int2 % 3 == 0
mov w8, #3                  // Load immediate value 3 into w8
sdiv w9, w1, w8             // Divide int2 by 3, result in w9
msub w9, w9, w8, w1         // Multiply w9 by 3 and subtract from int2, remainder in w9

cmp w9, #0                  // Compare remainder with 0
bne .Lnot_divisible_by_3    // If not 0, branch to .Lnot_divisible_by_3

// If int2 % 3 == 0: *outInt = int1 * int1
mul w10, w0, w0             // Multiply int1 by int1, result in w10
str w10, [x2]               // Store result to *outInt
b .Ldouble_check            // Branch to double comparison

.Lnot_divisible_by_3:
// Else: *outInt = int2 * int2
mul w10, w1, w1             // Multiply int2 by int2, result in w10
str w10, [x2]               // Store result to *outInt

.Ldouble_check:
// Check if double1 == double2
fcmp d0, d1                 // Compare double1 and double2
bne .Lnot_equal             // If not equal, branch to .Lnot_equal

// If double1 == double2: *outDouble = 0.0
fmov d10, #0.0              // Move immediate value 0.0 into d10
str d10, [x3]               // Store 0.0 to *outDouble
b .Lend_function            // Branch to end of function

.Lnot_equal:
// Else: *outDouble = double1 + double2
fadd d10, d0, d1            // Add double1 and double2, result in d10
str d10, [x3]               // Store result to *outDouble

.Lend_function:
ldp x29, x30, [sp], 16      // Restore frame pointer and link register
ret                         // Return from function
