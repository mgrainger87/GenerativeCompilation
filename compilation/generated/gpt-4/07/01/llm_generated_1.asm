//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!  // Allocate space on the stack and store x19, x20

// Line 1: *outInt = int1 * 3 - int2;
mov w20, #3            // w20 = 3
mul w20, w20, w0       // w20 = int1 * 3
sub w20, w20, w1       // w20 = int1 * 3 - int2
str w20, [x2]          // *outInt = w20

// Line 2: *outDouble = double1 - double2 * 3;
fmov d20, #3.0         // d20 = 3.0
fmul d20, d20, d1      // d20 = double2 * 3
fsub d20, d0, d20      // d20 = double1 - d20
str d20, [x3]          // *outDouble = d20

// Restore callee-saved registers
ldp x19, x20, [sp], #16  // Load x19, x20 from the stack and deallocate space

ret
