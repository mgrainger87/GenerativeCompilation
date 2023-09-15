//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!     // Save frame pointer and link register
mov x29, sp                  // Set up frame pointer

// Body of the function
mov w4, wzr                  // Initialize sum register (w4) to 0
str w4, [x2]                 // Store 0 to *outInt
cmp w0, w1                   // Compare int1 and int2
b.gt 1f                      // If int1 > int2, skip the loop

// Loop start
2:
add w4, w4, w0               // w4 += int1
add w0, w0, #1               // int1++
cmp w0, w1                   // Compare int1 and int2
b.le 2b                      // If int1 <= int2, repeat the loop

// Loop end
1:
str w4, [x2]                 // Store the result to *outInt
fmov d4, #0.0                // Load 0.0 into d4
str d4, [x3]                 // Store 0.0 to *outDouble

// Epilogue
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret                         // Return
