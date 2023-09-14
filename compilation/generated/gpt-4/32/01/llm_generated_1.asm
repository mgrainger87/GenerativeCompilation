//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                // Set frame pointer

// Check if int2 (x1) is <= 0
cmp x1, #0
ble .handle_less_equal_zero

// Recursive call: customFunction(int1+1, int2-1, double1, double2+1, outInt, outDouble)
add x0, x0, #1             // int1 + 1
sub x1, x1, #1             // int2 - 1

fmov d2, #1.0              // Load constant 1.0 to d2
fadd d1, d1, d2            // double2 + 1

bl _customFunction         // Recursive call

// Restore link register and return
ldp x29, x30, [sp], #16
ret

.handle_less_equal_zero:
// *outInt = int1
str w0, [x2]               // Store int1 to outInt

// *outDouble = double1
str d0, [x3]               // Store double1 to outDouble

// Restore link register and return
ldp x29, x30, [sp], #16
ret
