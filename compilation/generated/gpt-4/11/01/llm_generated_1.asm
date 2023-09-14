//compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save the link register to preserve the return address
sub     sp, sp, #16    // Decrement SP to reserve 16 bytes on the stack
str     lr, [sp]       // Store LR on the stack

// Compare int1 (w0) with int2 (w1)
cmp     w0, w1

// If int1 > int2, set values from int1 and double1. Otherwise, set values from int2 and double2
b.le    .Lelse_branch

// int1 > int2
// Store int1 at the memory address pointed to by outInt
str     w0, [x2]

// Store double1 at the memory address pointed to by outDouble
str     d0, [x3]
b       .Lend

.Lelse_branch:
// Store int2 at the memory address pointed to by outInt
str     w1, [x2]

// Store double2 at the memory address pointed to by outDouble
str     d1, [x3]

.Lend:
// Restore link register
ldr     lr, [sp]       // Load LR from the stack
add     sp, sp, #16    // Increment SP to release the reserved space

// Return to the calling function
ret
