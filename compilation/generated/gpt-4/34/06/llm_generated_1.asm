//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// First, save the link register to the stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Check if double2 (d1) is <= 0
fcmp d1, #0.0
b.gt .recursive_call

// If we are here, double2 is <= 0
// *outInt = int1;
str w0, [x2]

// *outDouble = double1 + double2;
fadd d4, d0, d1
str d4, [x3]

// Restore link register and return
ldp x30, x29, [sp], #16
ret

.recursive_call:
// customFunction(int1+1, int2-1, double1+0.5, double2-0.5, outInt, outDouble);

// Update int1 and int2
add w0, w0, #1
sub w1, w1, #1

// Update double1 and double2
fmov d4, #0.5
fadd d0, d0, d4
fsub d1, d1, d4

// Call customFunction recursively
bl _customFunction

// Restore link register and return
ldp x30, x29, [sp], #16
ret
