//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  3
_customFunction:
// Store the link register (return address) and frame pointer to the stack
stp     x29, lr, [sp, #-16]!
mov     x29, sp          // Set up frame pointer for current function

// Compute int1 - int2 and store it to the address pointed by outInt
sub     w4, w0, w1        // w4 = int1 - int2
str     w4, [x2]          // Store result to *outInt

// Compute double1 - double2 and store it to the address pointed by outDouble
fsub    d2, d0, d1        // d2 = double1 - double2
str     d2, [x3]          // Store result to *outDouble

// Restore the frame pointer and link register, then return
ldp     x29, lr, [sp], #16
ret
