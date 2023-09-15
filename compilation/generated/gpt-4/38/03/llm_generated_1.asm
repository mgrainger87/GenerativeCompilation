//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register to the stack
mov x29, sp                // Set the frame pointer to the current stack pointer

// Check if int2 (x1) < 5
cmp w1, #5
b.ge .Lelse

// If branch
// *outInt = int1
str w0, [x2]

// *outDouble = double1 + double2
fadd d4, d0, d1
str d4, [x3]

b .Lend

.Lelse:
// Else branch: customFunction(int1, int2-2, double1, double2-1, outInt, outDouble)
sub w4, w1, #2

// Corrected part: Load 1.0 into d5 and use it for subtraction
fmov d5, #1.0
fsub d5, d1, d5

bl _customFunction

.Lend:
// Epilogue
ldp x29, x30, [sp], #16   // Restore frame pointer and link register from the stack
ret
