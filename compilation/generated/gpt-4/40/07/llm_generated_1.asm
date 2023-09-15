//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and the link register
stp x29, x30, [sp, #-16]!     // Push x29 (FP) and x30 (LR) onto the stack
mov x29, sp                   // Set x29 (FP) to the current stack pointer (sp)

// Load required constants into floating-point registers
fmov d8, #10.0                // Load 10 into d8

// Check if double2 (d1) is < 10
fcmp d1, d8                   // Compare double2 with 10
b.ge .else_part               // If double2 >= 10, jump to the else part

// Then part
str x1, [x2]                 // Store int2 into *outInt
fmul d9, d0, d1              // Multiply double1 and double2 and store result in d9
str d9, [x3]                 // Store result of multiplication into *outDouble
b .end_function              // Jump to end of function

// Else part
.else_part:
add x0, x0, #2               // int1 = int1 + 2
fmov d9, #1.0                // Load 1.0 into d9
fadd d0, d0, d9              // double1 = double1 + 1.0
fsub d1, d1, d9              // double2 = double2 - 1.0
bl _customFunction           // Recursive call

// End of function
.end_function:
// Restore callee-saved registers and the link register
ldp x29, x30, [sp], #16      // Pop x29 (FP) and x30 (LR) from the stack
ret                          // Return
