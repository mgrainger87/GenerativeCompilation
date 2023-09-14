//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x29, x30, [sp, -16]!
mov x29, sp

// *outDouble = double1;
str d0, [x3]

// Initialize the loop counter
mov w4, wzr // w4 will be used as our loop counter (i)

.loop_start:
// Check if the loop condition is satisfied
cmp w4, w0
b.ge .loop_end

// *outDouble /= double2;
ldr d5, [x3] // Load current value of *outDouble into d5
fdiv d5, d5, d1
str d5, [x3] // Store the updated value of *outDouble

// Increment loop counter
add w4, w4, #1

// Continue the loop
b .loop_start

.loop_end:
// *outInt = 0;
mov w5, wzr // w5 will be used to store the integer 0
str w5, [x2]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
