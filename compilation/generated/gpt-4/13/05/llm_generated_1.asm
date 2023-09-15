//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save link register to the stack (for the return address)
stp x30, x29, [sp, #-16]!  // Pre-decrement the stack pointer by 16 bytes
mov x29, sp                // Set up frame pointer

// Compare int1 and int2
cmp x0, x1

// If they are not equal, branch to the else block
b.ne .Lelse

// If equal: *outInt = int1 * int2
mul w4, w0, w1             // Multiply int1 and int2, store result in w4
str w4, [x2]              // Store result in *outInt

// *outDouble = double1 + double2
fadd d4, d0, d1           // Add double1 and double2, store result in d4
str d4, [x3]              // Store result in *outDouble
b .Lend                   // Jump to the end

.Lelse:
// If not equal: *outInt = 0
mov w4, #0                // Move immediate value 0 into w4
str w4, [x2]              // Store result in *outInt

// *outDouble = 0.0
fmov d4, #0.0             // Move immediate floating point value 0.0 into d4
str d4, [x3]              // Store result in *outDouble

.Lend:
// Restore link register from the stack and return
ldp x30, x29, [sp], #16   // Post-increment the stack pointer by 16 bytes
ret
