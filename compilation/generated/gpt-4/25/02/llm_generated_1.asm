//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save link register and callee-saved registers
stp x29, x30, [sp, #-16]! // Push x29 (Frame Pointer) and x30 (Link Register) onto the stack
mov x29, sp // Set up frame pointer for current function

// *outDouble = double1;
str d0, [x3]

// Initialize loop counter 'i' to 0
mov w4, #0 // w4 will be our loop counter 'i'

loop_start:
// Check loop condition: i < int1
cmp w4, w0
b.ge loop_end // If i >= int1, exit loop

// Inside loop: *outDouble -= double2;
ldr d5, [x3] // Load *outDouble to d5
fsub d5, d5, d1 // d5 = d5 - d1
str d5, [x3] // Store the result back to *outDouble

// Increment loop counter 'i'
add w4, w4, #1
b loop_start

loop_end:
// *outInt = 0;
mov w5, #0
str w5, [x2]

// Restore link register and callee-saved registers, then return
ldp x29, x30, [sp], #16
ret
