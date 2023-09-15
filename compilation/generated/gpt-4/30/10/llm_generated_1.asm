//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
.global _customFunction
_customFunction:
// Save the link register to the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outInt = int2
str w1, [x2]

// Initialize i = 0 in w4
mov w4, #0

// Convert double2 to an integer
fcvtzs w5, d1

loop_start:
// Check if i < double2
cmp w4, w5
b.ge loop_end

// *outInt -= int1
ldr w6, [x2]    // Load *outInt into w6
sub w6, w6, w0  // Subtract int1 from w6
str w6, [x2]    // Store w6 back to *outInt

// Increment i
add w4, w4, #1

// Go back to start of loop
b loop_start

loop_end:
// *outDouble = 0.0
fmov d6, #0.0
str d6, [x3]   // Store 0.0 in *outDouble

// Restore link register and return
ldp x29, x30, [sp], #16
ret
