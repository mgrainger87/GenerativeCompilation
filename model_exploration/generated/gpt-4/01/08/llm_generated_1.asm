//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align	2
_customFunction:
// Preserve caller-saved registers
stp x8, x9, [sp, #-16]!  // push x8 and x9 onto the stack

// *outInt = int1;
str w0, [x2]

// *outDouble = double1;
str d0, [x3]

// Restore caller-saved registers
ldp x8, x9, [sp], #16  // pop x8 and x9 from the stack

ret
