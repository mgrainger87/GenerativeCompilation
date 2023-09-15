//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Preserve the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outInt = int2;
str w1, [x2]

// for(int i = 0; i < (int)double2; i++)
fcvtzs w4, d1  // Convert double2 to integer and store in w4
mov w5, wzr    // Initialize i with 0, using w5 for i

.loop_start:
cmp w5, w4     // Compare i (w5) with double2's integer value (w4)
b.ge .loop_end // If i >= (int)double2, exit loop

// *outInt -= int1;
ldr w6, [x2]   // Load *outInt into w6
sub w6, w6, w0 // Subtract int1 (w0) from w6
str w6, [x2]   // Store the result back to *outInt

add w5, w5, #1 // Increment i
b .loop_start  // Go back to the start of the loop

.loop_end:
// *outDouble = 0.0;
movz x6, #0      // Clear integer register x6
fmov d6, x6      // Move integer zero to floating point register d6
str d6, [x3]     // Store 0.0 to *outDouble

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
