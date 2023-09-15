//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save callee-saved registers and the link register (x30)
stp x29, x30, [sp, #-16]!  // Push x29 (frame pointer) and x30 (link register) to the stack
mov x29, sp               // Set the frame pointer to the current stack pointer

// *outInt = int2;
str w1, [x2]

// For loop setup
fcvtzs w4, d1   // Convert double2 to integer and store in w4
mov w5, #0      // Initialize loop counter i to 0

loop_start:
cmp w5, w4      // Compare loop counter i with double2
bge loop_end    // Exit loop if i >= double2

// Loop body: *outInt -= int1;
ldr w6, [x2]    // Load value from *outInt into w6
sub w6, w6, w0  // Subtract int1 from w6
str w6, [x2]    // Store result back to *outInt

// Increment loop counter and jump back to loop_start
add w5, w5, #1  // Increment loop counter i
b loop_start    // Jump back to loop_start

loop_end:
// *outDouble = 0.0;
fmov d7, #0.0   // Load 0.0 into floating-point register d7
str d7, [x3]    // Store 0.0 to *outDouble

// Epilogue: Restore callee-saved registers and return
ldp x29, x30, [sp], #16  // Pop x29 and x30 from the stack
ret
