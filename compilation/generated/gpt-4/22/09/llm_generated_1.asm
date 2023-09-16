//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: save frame pointer and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outInt = 1;
mov w4, #1
str w4, [x2]

// for(int i = 1; i <= int1; i++) {
//     *outInt *= i;
// }
mov w5, #1        // w5 = i
1:                    // local label for loop start
cmp w5, w0        // compare i with int1
bgt 2f            // if i > int1, break the loop
ldr w4, [x2]      // load *outInt into w4
mul w4, w4, w5    // *outInt *= i
str w4, [x2]      // store the result back to *outInt
add w5, w5, #1    // i++
b 1b              // jump back to the start of the loop

2:                    // local label for loop end

// *outDouble = 0.0;
fmov d4, #0.0
str d4, [x3]

// Epilogue: restore frame pointer and link register
ldp x29, x30, [sp], #16
ret
