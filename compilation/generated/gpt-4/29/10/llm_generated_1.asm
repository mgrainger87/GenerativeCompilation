//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store callee-saved registers and link register (lr)
stp x29, x30, [sp, #-16]!
mov x29, sp

// Assign double1 to *outDouble
str d0, [x3]

// Initialize loop counter
mov w4, wzr   // w4 will be our loop counter (i)

loop_start:
// Check if i < int1
cmp w4, w0
b.ge loop_end

// Perform the division: *outDouble /= double2
ldr d2, [x3]
fdiv d2, d2, d1
str d2, [x3]

// Increment loop counter
add w4, w4, #1

// Repeat loop
b loop_start

loop_end:
// Set *outInt to 0
mov w5, wzr
str w5, [x2]

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret
