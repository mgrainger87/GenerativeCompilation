//compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=0
.global _customFunction

// Align symbols appropriately for arm64
.align 3

_customFunction:
// Save link register (return address) to the stack for later
stp x30, x29, [sp, #-16]!
// Update frame pointer
mov x29, sp

// Compare int1 and int2
cmp w0, w1

// If int1 is equal to int2, jump to label 1
beq 1f

// If int1 is not equal to int2, we'll make a recursive call
// First, update the values of int1 and int2
add w0, w0, #1
sub w1, w1, #1

// Save the argument registers that will be overwritten by the call
stp x2, x3, [sp, #-16]!

// Call customFunction recursively
bl _customFunction

// Restore the argument registers
ldp x2, x3, [sp], #16

// Restore link register and frame pointer, then return
ldp x30, x29, [sp], #16
ret

1:  // If int1 is equal to int2
// Store int1 to *outInt
str w0, [x2]

// Store double1 to *outDouble
str d0, [x3]

// Restore link register and frame pointer, then return
ldp x30, x29, [sp], #16
ret
