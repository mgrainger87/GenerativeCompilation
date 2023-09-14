//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and frame pointer on the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare int1 and int2
cmp w0, w1
beq .equal

// If not equal, prepare for recursive call
// int1 + 1 -> w0
add w0, w0, #1

// int2 - 1 -> w1
sub w1, w1, #1

// Call customFunction recursively
bl _customFunction

// Restore the link register and frame pointer, and return
ldp x29, x30, [sp], #16
ret

.equal:
// Store int1 into *outInt
str w0, [x2]

// Store double1 into *outDouble
str d0, [x3]

// Restore the link register and frame pointer, and return
ldp x29, x30, [sp], #16
ret
