//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register to the stack
sub sp, sp, #16  // decrement the stack pointer by 16 bytes
str lr, [sp]    // store lr at the current stack address

// Check if int1 (w0) is <= 0
cmp w0, #0
ble 1f // branch to local label 1 if condition is met

// If int1 > 0
// Prepare arguments for recursive call
// int1-1
sub w0, w0, #1
// int2+1
add w1, w1, #1
// double1+1
fmov d7, #1.0
fadd d0, d0, d7

// Call customFunction recursively
bl _customFunction

// Restore link register and return
ldr lr, [sp]     // load lr from the stack
add sp, sp, #16  // increment the stack pointer by 16 bytes
ret

1:  // If int1 <= 0
// Store int2 to *outInt
str w1, [x2]
// Store double2 to *outDouble
str d1, [x3]

// Restore link register and return
ldr lr, [sp]
add sp, sp, #16
ret
