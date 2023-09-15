//compiler_errors=1,linker_errors=1,execution_errors=1,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions

// Declare helperFunction as a global function
.globl  _helperFunction
.p2align    3
_helperFunction:
// Multiply a by b (x0 * x1) and store the result in x0
mul     w0, w0, w1
// Return, x0 already contains the result
ret

// Declare customFunction as a global function
.globl  _customFunction
.p2align    3
_customFunction:
// Save link register (lr) to stack
str     lr, [sp, #-16]!
// Call helperFunction with int1 (x0) and int2 (x1)
bl      _helperFunction
// Load the result of helperFunction (x0) to *outInt (x2)
str     w0, [x2]
// Load double2 (d1) to *outDouble (x3)
str     d1, [x3]
// Restore link register (lr) from stack
ldr     lr, [sp], #16
// Return to caller
ret
