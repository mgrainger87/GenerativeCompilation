//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Save the link register to the stack
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Function body
add     x0, x0, #10   // a + 10

// Restore link register and return
ldp     x30, x29, [sp], #16
ret
.global _customFunction
_customFunction:
// Save the link register and callee-saved registers to the stack
stp     x30, x29, [sp, #-16]!
mov     x29, sp
stp     x19, x20, [sp, #-16]!
stp     d8, d9, [sp, #-16]!

// Call helperFunction with int1
mov     x19, x2       // Save *outInt pointer
bl      _helperFunction
str     x0, [x19]     // Store result of helperFunction to *outInt

// Store double2 to *outDouble
str     d1, [x3]

// Restore callee-saved registers and return
ldp     d8, d9, [sp], #16
ldp     x19, x20, [sp], #16
ldp     x30, x29, [sp], #16
ret
