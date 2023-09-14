//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and frame pointer
stp lr, fp, [sp, #-16]!      // Decrement stack pointer by 16 bytes and store lr and fp
mov fp, sp                   // Update frame pointer to current stack pointer

// Load immediate floating point value 5.0 into d2
fmov d2, #5.0

// Compare double2 (d1) with 5.0 (d2)
fcmp d1, d2
b.ge .double_greater_than_or_equal_to_5 // If double2 >= 5.0, jump to label

// If double2 < 5.0, then *outDouble = double1
str d0, [x3]                 // Store d0 (double1) into memory address x3 (outDouble)
b .end_double                // Jump to end of double processing

.double_greater_than_or_equal_to_5:
// *outDouble = double2
str d1, [x3]

.end_double:
// Check if int1 > 10
cmp w0, #10
b.le .int1_less_than_or_equal_to_10 // If int1 <= 10, jump to label

// If int1 > 10, then *outInt = int1 * int2
mul w4, w0, w1               // Multiply w0 (int1) with w1 (int2) and store in w4
str w4, [x2]                // Store w4 into memory address x2 (outInt)
b .end                       // Jump to end

.int1_less_than_or_equal_to_10:
// *outInt = int1 + int2
add w4, w0, w1
str w4, [x2]

.end:
// Restore frame and link registers and return
ldp lr, fp, [sp], #16        // Pop values into lr and fp and increment stack pointer
ret                          // Return to caller
