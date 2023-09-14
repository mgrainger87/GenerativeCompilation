//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Entry: Setup the stack frame
stp     x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov     x29, sp               // Update frame pointer to current stack pointer

// Calculate int1 + int2 and compare with 100
add     w4, w0, w1            // w4 = int1 + int2
cmp     w4, #100              // Compare w4 with 100

// If (int1 + int2) > 100, we take the first branch
b.gt    .Lgreater_than_100    // Branch if greater

// Otherwise, execute the else branch
str     w4, [x2]              // Store the result of int1 + int2 to *outInt
fadd    d4, d0, d1            // d4 = double1 + double2
str     d4, [x3]              // Store d4 to *outDouble
b       .Lend                 // Jump to function end

.Lgreater_than_100:
mov     w4, #100              // Load 100 into w4
str     w4, [x2]              // Store 100 to *outInt
fmul    d4, d0, d1            // d4 = double1 * double2
str     d4, [x3]              // Store d4 to *outDouble

.Lend:
// Exit: Restore frame pointer and link register and return
ldp     x29, x30, [sp], #16   // Restore frame pointer and link register and update the stack pointer
ret                           // Return
