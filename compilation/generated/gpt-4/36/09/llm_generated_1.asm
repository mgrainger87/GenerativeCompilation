//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and frame pointer to the stack
stp x29, lr, [sp, #-16]!

// Set up the frame pointer for this function
mov x29, sp

// Compare double1 and double2
fcmp d0, d1

// If they are equal, then branch to the equal label
beq 1f

// If they are not equal, then perform the recursive function call
// Update int2 (w1 = w1 + 1)
add w1, w1, #1

// Update double1 (double1 = double1 - 0.1)
adr x4, 2f
ldr d4, [x4]
fsub d0, d0, d4

// Update double2 (double2 = double2 + 0.1)
fadd d1, d1, d4

// Call customFunction recursively
bl _customFunction

// Restore frame pointer and link register from the stack and return
ldp x29, lr, [sp], #16
ret

1:  // Equal label
// Store int2 to *outInt
str w1, [x2]

// Store double2 to *outDouble
str d1, [x3]

// Restore frame pointer and link register from the stack and return
ldp x29, lr, [sp], #16
ret

2:  .double 0.1
