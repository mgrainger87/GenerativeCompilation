//compiler_errors=4,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Reserve space for the arguments we might modify for the recursive call
sub sp, sp, #16

// Load the value of double_10 into d4
adrp x4, double_10@GOTPAGE
ldr  x4, [x4, double_10@GOTPAGEOFF]
ldr  d4, [x4]

// Check if double2 (d1) is less than 10
fcmp d1, d4
b.ge .else_part

.then_part:
// *outInt = int2;
str w1, [x2]

// *outDouble = double1 * double2;
fmul d5, d0, d1
str  d5, [x3]

b .end_function

.else_part:
// Load the value of double_1 into d5
adrp x5, double_1@GOTPAGE
ldr  x5, [x5, double_1@GOTPAGEOFF]
ldr  d5, [x5]

// Update the arguments for recursive call
add w0, w0, #2
fadd d0, d0, d5
fsub d1, d1, d5

// Recursive call
bl _customFunction

b .end_function

.end_function:
// Restore the stack for local variables
add sp, sp, #16

// Restore callee-saved registers and the link register
ldp x29, x30, [sp], #16
ret

.data
double_10:
.double 10.0

double_1:
.double 1.0
