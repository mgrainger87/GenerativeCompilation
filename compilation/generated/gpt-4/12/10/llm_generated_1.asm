//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the frame pointer (fp) and link register (lr)
stp fp, lr, [sp, #-16]!   // Save the fp and lr on the stack and decrement the stack pointer
mov fp, sp                // Update the frame pointer

// Compare double1 and double2
fcmp d0, d1

// Branch to the else part if double1 is less than or equal to double2
ble .LelsePart

// If double1 > double2
// *outInt = int1 + int2
add w4, w0, w1            // w4 = int1 + int2
str w4, [x2]             // Store w4 to outInt

// *outDouble = double1
fmov d2, d0              // Move double1 to d2 for storing
str d2, [x3]             // Store d2 to outDouble

// Restore frame pointer (fp) and link register (lr) and return
ldp fp, lr, [sp], #16
ret

.LelsePart:
// *outInt = int1 - int2
sub w4, w0, w1            // w4 = int1 - int2
str w4, [x2]             // Store w4 to outInt

// *outDouble = double2
fmov d2, d1              // Move double2 to d2 for storing
str d2, [x3]             // Store d2 to outDouble

// Restore frame pointer (fp) and link register (lr) and return
ldp fp, lr, [sp], #16
ret
