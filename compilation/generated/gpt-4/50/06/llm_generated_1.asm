//compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=0
.global _helperFunction
.align 4
_helperFunction:
add x0, x0, #10     // a = a + 10
ret
.global _customFunction
.align 4
_customFunction:
// Save the link register since we're making a function call
stp x30, x19, [sp, #-16]!

// Call helperFunction with int1
bl _helperFunction

// Store the result in *outInt
str w0, [x2]

// Store double2 in *outDouble
str d1, [x3]

// Restore the saved registers
ldp x30, x19, [sp], #16

ret
