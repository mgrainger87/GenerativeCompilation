//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, -16]!   // Save frame pointer and link register
mov x29, sp               // Set frame pointer

// Check condition (double1 < 10)
fmov d2, #10.0            // Load 10.0 into d2
fcmp d0, d2               // Compare double1 with 10.0
b.ge 1f                   // If double1 >= 10, branch to else part

// True branch
mul w4, w0, w1            // Multiply int1 and int2, result in w4
str w4, [x2]              // Store result to *outInt
str d0, [x3]              // Store double1 to *outDouble
b 2f                      // Jump to function end

1:  // Else branch
add x1, x1, #2            // Increment int2 by 2
fmov d3, #1.0             // Load 1.0 into d3
fsub d0, d0, d3           // Decrement double1 by 1 using d3
fadd d1, d1, d3           // Increment double2 by 1 using d3
bl _customFunction        // Call customFunction recursively

2:  // Epilogue
ldp x29, x30, [sp], 16    // Restore frame pointer and link register
ret                       // Return
