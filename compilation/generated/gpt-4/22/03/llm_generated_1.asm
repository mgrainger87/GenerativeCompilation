//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and frame pointer
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outInt = 1;
mov w8, #1
str w8, [x2]

// for(int i = 1; i <= int1; i++)
mov w9, #1          // w9 is our loop counter i

1:                      // Local label for the loop start
cmp w9, w0
bgt 2f              // Break if i > int1

// *outInt *= i;
ldr w10, [x2]       // Load current value of *outInt into w10
mul w10, w10, w9    // Multiply w10 by i
str w10, [x2]       // Store the result back to *outInt

add w9, w9, #1      // Increment i
b 1b                // Loop back

2:                      // Local label for loop end

// *outDouble = 0.0;
fmov d4, #0.0
str d4, [x3]

// Restore link register and frame pointer
ldp x29, x30, [sp], #16
ret
