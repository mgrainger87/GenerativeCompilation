//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Compare int1 (x0) with int2 (x1)
cmp w0, w1
b.ne .recursion    // If not equal, go to recursion

// If equal, store values
str w0, [x2]       // Store int1 to *outInt
str d0, [x3]       // Store double1 to *outDouble
ret

.recursion:
// Save the link register (lr or x30) as we'll be doing a function call
// Additionally, save x0, x1, x2, x3 as they will be modified for the recursive call
stp x0, x1, [sp, #-16]!
stp x2, x3, [sp, #-16]!
stp x30, xzr, [sp, #-16]! // xzr is a zero register, used here just for alignment

// Modify arguments for recursion: int1+1 and int2-1
add w0, w0, #1
sub w1, w1, #1

// Call the function recursively
bl _customFunction

// Restore the saved registers and return
ldp x30, xzr, [sp], #16
ldp x2, x3, [sp], #16
ldp x0, x1, [sp], #16
ret
