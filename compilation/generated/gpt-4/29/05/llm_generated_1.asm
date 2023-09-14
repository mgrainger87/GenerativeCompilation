//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to stack (since we're calling another function)
stp x29, x30, [sp, #-16]!
mov x29, sp

// Step 2: Initialize *outDouble with double1 value
str d0, [x3]

// Check if int1 is 0 or less; if so, skip the loop
cbz w0, .Lend_loop

.Lloop_start:
// Step 3: Divide *outDouble by double2
ldr d2, [x3]
fdiv d2, d2, d1
str d2, [x3]

// Decrement int1 and check if it's 0
sub w0, w0, #1
cbz w0, .Lend_loop
b .Lloop_start

.Lend_loop:
// Step 4: Set *outInt to 0
mov w4, #0
str w4, [x2]

// Restore link register and return
ldp x29, x30, [sp], #16
ret
