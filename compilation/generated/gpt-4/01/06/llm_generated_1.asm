//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _customFunction
.align  2
_customFunction:
// Save the link register
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Add integers and store the result
add     w4, w0, w1
str     w4, [x2]

// Add doubles and store the result
fadd    d4, d0, d1
str     d4, [x3]

// Restore the link register and return
ldp     x30, x29, [sp], #16
ret
