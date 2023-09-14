//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and link register
stp x19, x20, [sp, #-16]!   // Push x19 and x20 onto the stack
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!
stp x29, x30, [sp, #-16]!   // Save frame pointer (x29) and link register (x30)
add x29, sp, #0             // Set frame pointer to current stack pointer

// Compute int1 + int2
add w19, w0, w1             // Use w19 as a temporary register

// Check if int1 + int2 > 100
cmp w19, #100
b.le .Lelse

.Lif:
// *outInt = 100;
mov w20, #100               // Load 100 into w20
str w20, [x2]               // Store the value into *outInt

// *outDouble = double1 * double2;
fmul d20, d0, d1            // Multiply double1 and double2
str d20, [x3]               // Store the result into *outDouble
b .Lend

.Lelse:
// *outInt = int1 + int2;
str w19, [x2]               // Store the sum into *outInt

// *outDouble = double1 + double2;
fadd d20, d0, d1            // Add double1 and double2
str d20, [x3]               // Store the result into *outDouble

.Lend:
// Restore callee-saved registers and link register
ldp x29, x30, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret                         // Return
