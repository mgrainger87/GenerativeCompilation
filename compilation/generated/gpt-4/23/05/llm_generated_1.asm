//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp     x29, x30, [sp, #-16]!     ; Push frame pointer and link register onto the stack
str     w0, [x2]                  ; *outInt = int1
mov     w4, #0                    ; w4 (i) = 0

1:                                   ; Start of the for-loop
cmp     w4, w1                    ; Compare i (w4) with int2 (w1)
b.ge    2f                        ; Exit loop if i >= int2

ldr     w5, [x2]                  ; Load *outInt into w5
lsl     w5, w5, #1                ; w5 = w5 * 2
str     w5, [x2]                  ; Store w5 back to *outInt

add     w4, w4, #1                ; Increment i (w4)
b       1b                        ; Jump back to start of loop

2:                                   ; Exit of the for-loop
fmov    d0, #0.0                  ; Load floating point 0.0 into d0
str     d0, [x3]                  ; *outDouble = 0.0

ldp     x29, x30, [sp], #16       ; Pop frame pointer and link register from the stack
ret                               ; Return from function
