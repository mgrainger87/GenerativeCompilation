//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp     fp, lr, [sp, #-16]!   // Store fp and lr to the stack
mov     fp, sp               // Update the frame pointer

// Function body
// *outInt = int1;
str     w0, [x2]             // Store w0 to the memory pointed by x2

// for(int i = 0; i < int2; i++)
mov     w8, wzr              // w8 is used as our local variable 'i'
_loop_start:
cmp     w8, w1               // Compare i with int2
bge     _loop_end            // If i >= int2, exit the loop

// *outInt *= 2;
ldr     w9, [x2]             // Load *outInt into w9
lsl     w9, w9, #1           // Multiply by 2 (logical shift left by 1)
str     w9, [x2]             // Store back the result to *outInt

add     w8, w8, #1           // Increment i
b       _loop_start          // Jump back to the loop start

_loop_end:
// *outDouble = 0.0;
fmov    d8, #0.0             // Load 0.0 into d8
str     d8, [x3]             // Store d8 to the memory pointed by x3

// Epilogue
ldp     fp, lr, [sp], #16    // Restore fp and lr from the stack and adjust sp
ret                          // Return
