//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.text

.align 2
_helperFunction:
// Multiply the input by itself
mul w0, w0, w0
ret

.align 2
.global _customFunction
_customFunction:
// Save the link register (return address)
stp x30, x29, [sp, #-16]!
mov x29, sp

// Call helperFunction
bl _helperFunction
// Store the result into *outInt
str w0, [x2]

// Subtract double2 from double1
fsub d0, d0, d1
// Store the result into *outDouble
str d0, [x3]

// Restore the link register and frame pointer
ldp x30, x29, [sp], #16
ret
