//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and link register
stp x29, x30, [sp, #-16]!   // Push x29 and x30 onto the stack (pre-decrement)
mov x29, sp                 // Set frame pointer

// Compare double1 (d0) with 0.0
fmov d2, #0.0               // Load 0.0 into d2 for comparison
fcmp d0, d2                 // Compare d0 with d2
beq .1_zero                 // Branch if equal to label 1_zero

// If double1 is not 0.0
sub w4, w0, w1              // Subtract int2 from int1
str w4, [x2]                // Store the result at the address pointed by outInt
fmov d3, d0                // Move double1 to d3
str d3, [x3]                // Store d3 at the address pointed by outDouble
b .2_end                    // Branch to end

.1_zero:
// If double1 is 0.0
add w4, w0, w1              // Add int1 and int2
str w4, [x2]                // Store the result at the address pointed by outInt
fmov d3, #1.0               // Load 1.0 into d3
str d3, [x3]                // Store d3 at the address pointed by outDouble

.2_end:
// Restore callee-saved registers and return
ldp x29, x30, [sp], #16    // Pop x29 and x30 from the stack (post-increment)
ret                         // Return
