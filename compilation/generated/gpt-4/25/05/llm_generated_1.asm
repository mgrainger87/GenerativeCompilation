//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
stp x29, x30, [sp, #-16]!  // save frame and link register
mov x29, sp               // set frame pointer

str d0, [x3]              // *outDouble = double1

mov w4, wzr               // w4 = 0, our loop counter
loop_start:
cmp w4, w0                // compare i (w4) with int1 (w0)
b.ge loop_end             // if i >= int1, exit loop

ldr d2, [x3]              // load value at *outDouble into d2
fsub d2, d2, d1           // d2 = d2 - double2
str d2, [x3]              // store the result back to *outDouble

add w4, w4, #1            // increment loop counter
b loop_start              // jump back to start of loop
loop_end:

mov w5, wzr               // w5 = 0
str w5, [x2]              // *outInt = 0

ldp x29, x30, [sp], #16   // restore frame and link register
ret                       // return
