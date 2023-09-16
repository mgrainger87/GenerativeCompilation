//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3

_customFunction:
; Prologue: Save necessary registers and allocate space on the stack for local variables
stp x29, x30, [sp, #-16]!  ; Allocate space on the stack and save fp (x29) and lr (x30)
mov x29, sp               ; Set frame pointer to current stack pointer

; Initialize *outInt to 1
mov w4, #1
str w4, [x2]

; Initialize loop counter i to 1
mov w4, #1

.loop_start:
; Check loop condition: i <= int1
cmp w4, w0
b.gt .loop_end

; Multiply *outInt by i
ldr w5, [x2]  ; Load value of *outInt to w5
mul w5, w5, w4  ; w5 = w5 * w4
str w5, [x2]   ; Store result back to *outInt

; Increment loop counter i
add w4, w4, #1
b .loop_start

.loop_end:

; Initialize *outDouble to 0.0
fmov d4, #0.0
str d4, [x3]

; Epilogue: Restore registers and return
ldp x29, x30, [sp], #16  ; Restore fp and lr from the stack
ret                      ; Return to the caller
