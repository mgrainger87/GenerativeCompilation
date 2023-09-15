//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2

_customFunction:
// Prologue: Save necessary registers
stp x29, x30, [sp, #-16]!     // Save frame pointer and link register
mov x29, sp                  // Set up frame pointer for this function

// *outInt = int2;
str x1, [x2]

// for(int i = 0; i < (int)double2; i++)
// Convert double2 (d1) to integer and store in w4
fcvtzs w4, d1
mov w5, #0                  // Counter (i) initialized to 0

_for_loop_start:
// Check if i < (int)double2
cmp w5, w4
b.ge _for_loop_end

// *outInt -= int1;
ldr w6, [x2]                // Load *outInt into w6
sub w6, w6, w0              // Subtract int1
str w6, [x2]                // Store result back to *outInt

// Increment counter (i)
add w5, w5, #1
b _for_loop_start

_for_loop_end:
// *outDouble = 0.0;
movz x7, #0
str x7, [x3]

// Epilogue: Restore registers and return
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret
