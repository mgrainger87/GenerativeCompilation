//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// a is in d0 and b is in d1
fmul d0, d0, d1  // d0 = a * b
ret
.global _customFunction
_customFunction:
// Saving the link register (x30) to the stack
stp x30, x29, [sp, -16]!
mov x29, sp

// Call helperFunction with d0 and d1
bl _helperFunction
// Store result from d0 to *outDouble (x3)
str d0, [x3]

// Subtract int2 from int1
sub w0, w0, w1
// Store result to *outInt
str w0, [x2]

// Restore x30 (link register) and x29 (frame pointer) from the stack
ldp x30, x29, [sp], 16

ret
