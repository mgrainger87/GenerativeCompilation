//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store caller saved registers
stp x8, x9, [sp, #-16]!  // Push x8 and x9 onto stack (use x8 for loop counter later)
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp  // Update frame pointer

// *outInt = 0
mov w8, #0  // Use w8 for immediate value 0
str w8, [x2]  // Store w8 to memory address in x2

// Set up for loop: i = int1, stored in x8
mov w8, w0

loop_start:
// If i > int2, break
cmp w8, w1  // Compare i (in w8) with int2 (in w1)
b.gt loop_end  // If i > int2, exit loop

// *outInt += i
ldr w9, [x2]  // Load current value of *outInt into w9
add w9, w9, w8  // Add i to it
str w9, [x2]  // Store result back to *outInt

// Increment i and loop
add w8, w8, #1  // Increment i
b loop_start  // Jump back to loop_start

loop_end:
// *outDouble = 0.0
fmov d8, #0.0  // Load 0.0 into d8
str d8, [x3]  // Store d8 to memory address in x3

// Restore saved registers and return
ldp x29, x30, [sp], #16  // Restore frame pointer and link register
ldp x8, x9, [sp], #16  // Restore x8 and x9
ret
