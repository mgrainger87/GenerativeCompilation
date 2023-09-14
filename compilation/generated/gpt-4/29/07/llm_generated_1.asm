//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register (x30) and frame pointer (x29)
stp x29, x30, [sp, #-16]!
mov x29, sp

// Copy double1 to *outDouble
str d0, [x3]

// Initialize i (x19) to 0. We use x19 as it's a callee-saved register.
mov w19, wzr

// Start of the loop
1:
// Check if i < int1, if not, exit loop
cmp w19, w0
b.ge 2f

// *outDouble /= double2
ldr d2, [x3]
fdiv d2, d2, d1
str d2, [x3]

// Increment i
add w19, w19, #1

// Repeat the loop
b 1b

// End of the loop
2:
// Set *outInt to 0
str wzr, [x2]

// Restore the frame pointer and link register and return
ldp x29, x30, [sp], #16
ret
