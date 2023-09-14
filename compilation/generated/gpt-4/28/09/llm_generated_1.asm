//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
sub     sp, sp, #16     // Make space on the stack for the link register
str     lr, [sp]        // Save lr onto the stack

// *outInt = int1
str     w0, [x2]

// Initialize local loop variable i: set it to 0
mov     w4, wzr

// Loop header
1:
// Convert double1 to integer for comparison
fcvtzs  w5, d0

// Compare i and (int)double1
cmp     w4, w5

// If i >= (int)double1, exit loop
b.ge    2f

// *outInt += int2
ldr     w6, [x2]       // Load *outInt into w6
add     w6, w6, w1     // Add int2
str     w6, [x2]       // Store the result back to *outInt

// Increment loop counter i
add     w4, w4, #1

// Jump to loop header
b       1b

// End of loop
2:
// *outDouble = 0.0
fmov    d7, #0.0
str     d7, [x3]

// Restore the link register and return
ldr     lr, [sp]       // Load lr from the stack
add     sp, sp, #16    // Restore stack pointer
ret
