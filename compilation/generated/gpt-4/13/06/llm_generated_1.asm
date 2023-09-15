//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save frame pointer and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare int1 and int2
cmp w0, w1

// If they're not equal, jump to else block
b.ne 1f

// Code for if block
// *outInt = int1 * int2;
mul w4, w0, w1
str w4, [x2]

// *outDouble = double1 + double2;
fadd d4, d0, d1
str d4, [x3]
b 2f

1:  // Code for else block
// *outInt = 0;
mov w4, #0
str w4, [x2]

// *outDouble = 0.0;
fmov d4, #0.0
str d4, [x3]

2:  // End of function
// Restore frame pointer and link register
ldp x29, x30, [sp], #16
ret
