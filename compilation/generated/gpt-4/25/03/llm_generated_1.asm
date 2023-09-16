//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Preserve link register to return back to the caller after the function call.
stp x29, x30, [sp, -16]!
mov x29, sp

// *outDouble = double1
str d0, [x3]

// For loop initialization: int i = 0; we'll use w4 for 'i'
mov w4, #0

loop_start:
// Check loop condition: i < int1
cmp w4, w0
b.ge loop_end

// Inside loop: *outDouble -= double2
ldr d2, [x3]         // Load value of *outDouble to d2
fsub d2, d2, d1      // Subtract double2 from d2
str d2, [x3]         // Store result back to *outDouble

// Increment loop counter: i++
add w4, w4, #1
b loop_start

loop_end:
// *outInt = 0
str wzr, [x2]

// Restore link register and return
ldp x29, x30, [sp], #16
ret
