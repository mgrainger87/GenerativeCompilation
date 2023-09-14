//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.global _helperFunction
.align 3   // Align to 2^3 = 8 bytes. ARM64 instructions are 4 bytes, so this ensures two instructions per line.
_helperFunction:
// Load immediate value 10 into x1
mov     x1, #10
// Add x0 (a) and x1 (10) and store result in x0
add     x0, x0, x1
// Return
ret

.global _customFunction
.align 3   // Align to 2^3 = 8 bytes.
_customFunction:
// Store the link register x30 to the stack to save the return address
// And store x19 which we will use later
stp     x30, x19, [sp, #-16]!

// Call helperFunction with int1 as argument
mov     x0, x0  // Move int1 to x0
bl      _helperFunction

// Store the result of helperFunction (*outInt) in the memory location pointed by x2
str     w0, [x2]

// Store double2 in the memory location pointed by x3
str     d1, [x3]

// Restore the link register x30 and x19 from the stack
ldp     x30, x19, [sp], #16

// Return
ret
