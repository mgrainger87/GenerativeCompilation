//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
// Store the link register to the stack
str lr, [sp, #-16]!

// *outInt = int2;
str w1, [x2]

// *outDouble = double1;
str d0, [x3]

// Restore the link register
ldr lr, [sp], #16

// Return
ret
