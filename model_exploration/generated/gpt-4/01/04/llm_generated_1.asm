//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Function Prologue
stp x29, x30, [sp, -16]!  // Save the frame pointer and return address
mov x29, sp               // Set the new frame pointer

// Body of the function
str w0, [x2]              // *outInt = int1;
str d0, [x3]              // *outDouble = double1;

// Function Epilogue
ldp x29, x30, [sp], 16   // Restore the frame pointer and return address
ret                      // Return to caller
