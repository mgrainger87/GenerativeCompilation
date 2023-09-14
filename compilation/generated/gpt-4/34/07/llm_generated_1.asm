//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save callee-saved registers
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                 // Update frame pointer

// Check double2 <= 0
fcmp d1, #0.0
ble 1f                      // Branch to the first local label if condition is met

// Load floating point literals into registers
fmov d2, #0.5               // Load 0.5 into d2

// Recursive call
add x0, x0, #1              // int1 + 1
sub x1, x1, #1              // int2 - 1
fadd d0, d0, d2             // double1 + 0.5 using d2 register
fsub d1, d1, d2             // double2 - 0.5 using d2 register
bl _customFunction          // Recursive function call
b 2f                        // Branch to end

1:  // double2 <= 0
str w0, [x2]                // *outInt = int1
fadd d0, d0, d1             // double1 + double2
str d0, [x3]                // *outDouble = result

2:  // Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret
