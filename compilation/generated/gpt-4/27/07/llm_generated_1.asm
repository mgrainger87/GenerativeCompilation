//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp lr, x29, [sp, #-16]!    // save lr and frame pointer
mov x29, sp                // set frame pointer

fmov d4, #1.0              // load 1.0 into d4
str d4, [x3]               // store d4 to outDouble

mov w5, wzr                // i = 0
1:  // Loop start
cmp w5, w0                 // compare i and int1
bge 2f                     // if i >= int1, break

fmul d4, d0, d1            // d4 = double1 * double2

ldr d5, [x3]               // load the current value of outDouble into d5
fmul d4, d4, d5            // d4 = d4 * d5
str d4, [x3]               // store d4 to outDouble

add w5, w5, #1             // i++
b 1b                       // jump to loop start

2:  // Loop end
mov w4, wzr                // set w4 to 0
str w4, [x2]               // store w4 to outInt

ldp lr, x29, [sp], #16     // restore lr and frame pointer
ret                        // return
