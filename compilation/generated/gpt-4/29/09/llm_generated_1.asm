//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.global _customFunction

_customFunction:
// Save the link register
stp     lr, x19, [sp, #-16]! // Change x30 to x19 or any other callee-saved register

// Store double1 to outDouble
str     d0, [x3]

// Initialize loop counter (i) to 0. We'll use x4 for this purpose
mov     w4, wzr  // Zero register to x4

loop_start:
// Check the loop condition: if i < int1
cmp     w4, w0
b.ge    loop_end

// Inside loop: *outDouble /= double2;
ldr     d5, [x3]    // Load current value of *outDouble to d5
fdiv    d5, d5, d1  // d5 = d5 / d1
str     d5, [x3]    // Store the result back to *outDouble

// Increment the loop counter: i++
add     w4, w4, #1
b       loop_start

loop_end:
// After the loop: *outInt = 0;
str     wzr, [x2]   // Store 0 to *outInt

// Restore the link register and return
ldp     lr, x19, [sp], #16 // Change x30 to x19 or any other callee-saved register
ret
