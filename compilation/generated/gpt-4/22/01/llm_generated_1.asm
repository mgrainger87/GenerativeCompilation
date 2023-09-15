//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp     lr, xzr, [sp, #-16]!   ; Save the link register and decrement the stack pointer
mov     w4, #1                ; Load 1 into w4
str     w4, [x2]              ; Store w4 to memory location pointed by x2 (outInt)
mov     w5, #1                ; w5 will be our loop counter i, start from 1
1:  cmp     w5, w0                ; Compare i (w5) with int1 (w0)
bgt     2f                    ; If i > int1, exit the loop
ldr     w4, [x2]              ; Load *outInt into w4
mul     w4, w4, w5            ; Multiply w4 with w5 (i)
str     w4, [x2]              ; Store the result back to *outInt
add     w5, w5, #1            ; Increment the loop counter i
b       1b                    ; Go back to loop start
2:  fmov    d4, #0.0              ; Load 0.0 into d4
str     d4, [x3]              ; Store d4 to memory location pointed by x3 (outDouble)
ldp     lr, xzr, [sp], #16    ; Restore the link register and increment the stack pointer
ret                           ; Return
