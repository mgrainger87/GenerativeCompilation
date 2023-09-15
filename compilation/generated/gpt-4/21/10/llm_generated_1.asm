//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3

_customFunction:
// Store callee-saved registers
stp x19, x20, [sp, #-16]!    // Pre-decrement stack by 16 bytes and then store x19 and x20
stp x29, x30, [sp, #-16]!    // Store the frame pointer (x29) and link register (x30), and pre-decrement the stack by 16 bytes
add x29, sp, #0              // Set the frame pointer for this function

// *outInt = 0;
mov w19, wzr                 // Set w19 (temporary register) to zero
str w19, [x2]                // Store w19 to memory location pointed to by x2 (outInt)

// for(int i = 1; i <= int1; i++) {
//     *outInt += i;
// }
mov w20, #1                  // Set w20 (loop counter) to 1
1:  // Local label for loop start
cmp w20, w0                  // Compare loop counter (w20) with int1 (w0)
bgt 2f                       // Branch to label 2 if w20 > w0 (end of loop)

ldr w19, [x2]                // Load value of *outInt to w19
add w19, w19, w20            // Add loop counter to w19
str w19, [x2]                // Store updated value back to *outInt

add w20, w20, #1             // Increment loop counter
b 1b                         // Branch back to loop start

2:  // Local label for loop end

// *outDouble = 0.0;
fmov d19, #0.0               // Move 0.0 into floating point register d19
str d19, [x3]                // Store d19 to memory location pointed to by x3 (outDouble)

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16      // Load x29 and x30 from stack and post-increment stack pointer by 16 bytes
ldp x19, x20, [sp], #16      // Load x19 and x20 from stack and post-increment stack pointer by 16 bytes
ret
