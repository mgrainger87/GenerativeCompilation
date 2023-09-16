//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; Save frame pointer and link register to the stack
mov x29, sp               ; Set frame pointer to the current stack pointer

; *outInt = 1;
mov w4, #1
str w4, [x2]

; for(int i = 1; i <= int1; i++)
; We'll use w4 as our loop counter "i"
mov w4, #1

1:  ; Local label for the loop start
cmp w4, w0                ; Compare i (w4) with int1 (x0)
bgt 2f                    ; If i > int1, branch to label 2

; *outInt *= i;
ldr w5, [x2]              ; Load value at *outInt into w5
mul w5, w5, w4            ; Multiply *outInt with i
str w5, [x2]              ; Store the result back to *outInt

; Increment i and loop back
add w4, w4, #1            ; Increment i (w4)
b 1b                      ; Branch back to label 1

2:  ; End of the loop

; *outDouble = 0.0;
fmov d4, #0.0             ; Move 0.0 into d4
str d4, [x3]              ; Store the value to *outDouble

; Restore the frame pointer and link register and return
ldp x29, x30, [sp], #16
ret
