//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// Store callee-saved registers and the link register
stp     x19, x30, [sp, #-16]! // Save x19 (used for loop counter) and link register
stp     x20, x21, [sp, #-16]! // Save x20 (used for outInt value) and x21 (used for temp addition)

// Initialize *outInt to 0
mov     w20, wzr               // w20 is used to store the value of *outInt
str     w20, [x2]              // Store the value of w20 to the address pointed by outInt

// Check if we should even enter the loop
cbz     w0, .Lend_loop         // If int1 (x0) is 0, skip the loop

// Initialize loop counter
mov     w19, #1                // Set loop counter (x19) to 1

.Lloop_start:
// *outInt += i;
ldr     w21, [x2]              // Load *outInt to w21
add     w21, w21, w19          // Add loop counter value to it
str     w21, [x2]              // Store back the result to *outInt

// Increment loop counter and compare to int1
add     w19, w19, #1           // Increment loop counter
cmp     w19, w0               // Compare loop counter with int1
ble     .Lloop_start          // If less than or equal to int1, loop again

.Lend_loop:
// Initialize *outDouble to 0.0
fmov    d0, #0.0               // Load immediate 0.0 to d0
str     d0, [x3]              // Store 0.0 to the address pointed by outDouble

// Restore callee-saved registers and the link register
ldp     x20, x21, [sp], #16   // Restore x20 and x21
ldp     x19, x30, [sp], #16   // Restore x19 and link register
ret
