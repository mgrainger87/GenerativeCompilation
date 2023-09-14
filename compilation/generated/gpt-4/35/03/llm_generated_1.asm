//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save the link register (lr) onto the stack
stp lr, x29, [sp, #-16]!
mov x29, sp

// Compare int1 and int2
cmp w0, w1
beq .1_equal

// Branch for the recursive call if int1 is not equal to int2
add w0, w0, #1        // int1+1
sub w1, w1, #1        // int2-1
bl _customFunction    // Recursive call

// Restore link register (lr) and return
ldp lr, x29, [sp], #16
ret

.1_equal:
// Assign the value of int1 to the location pointed by outInt
str w0, [x2]

// Assign the value of double1 to the location pointed by outDouble
str d0, [x3]

// Restore link register (lr) and return
ldp lr, x29, [sp], #16
ret
