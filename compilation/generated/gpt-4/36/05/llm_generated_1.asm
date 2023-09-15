//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register (return address)
stp x30, x29, [sp, #-16]!
mov x29, sp

// Compare double1 and double2
fcmp d0, d1

// If they are not equal, branch to the recursive call
bne .call_recursive

// They are equal, store int2 and double2
str w1, [x2]
str d1, [x3]

// Restore the link register and return
ldp x30, x29, [sp], #16
ret

.call_recursive:
// Save required registers
stp x0, x1, [sp, #-16]!
stp x2, x3, [sp, #-16]!
stp d0, d1, [sp, #-16]!

// Load constants for floating point arithmetic
ldr x4, =0x3FB99999A0000000  // double representation for 0.1
fmov d2, x4

// Modify the arguments for the recursive call
add w1, w1, #1
fsub d0, d0, d2
fadd d1, d1, d2

// Call the function recursively
bl _customFunction

// Restore saved registers
ldp d0, d1, [sp], #16
ldp x2, x3, [sp], #16
ldp x0, x1, [sp], #16

// Restore the link register and return
ldp x30, x29, [sp], #16
ret
