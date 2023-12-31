//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3

_customFunction:
// Save lr to the stack
stp x30, x29, [sp, #-16]!  // Save pair x30 (lr) and x29 (fp)
mov x29, sp                // Set up frame pointer (fp)

// Compare int1 with int2
cmp w0, w1

// Branch if int1 is less than or equal to int2
ble .Lelse

// int1 > int2
str w0, [x2]               // Store int1 to *outInt
str d0, [x3]              // Store double1 to *outDouble
b .Lend

.Lelse:
str w1, [x2]               // Store int2 to *outInt
str d1, [x3]              // Store double2 to *outDouble

.Lend:
// Restore lr and fp from the stack
ldp x30, x29, [sp], #16   // Load pair x30 (lr) and x29 (fp)
ret                       // Return to caller
