//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!      ; Save frame pointer and link register
mov x29, sp                   ; Set frame pointer

; Initialize *outInt to 0
mov w4, #0
str w4, [x2]

; Loop setup
mov w4, #1                    ; w4 will be our loop counter i
mov w5, #0                    ; w5 will be our sum accumulator

1:  ; Loop start label

; Loop condition: if w4 > w0 (i > int1), exit loop
cmp w4, w0
bgt 2f

; Loop body: w5 += w4
add w5, w5, w4
add w4, w4, #1                ; increment i
b 1b                          ; jump back to start of loop

2:  ; Loop end label

; Store sum result to *outInt
str w5, [x2]

; Initialize *outDouble to 0.0
fmov d4, #0.0
str d4, [x3]

; Finish up and return
ldp x29, x30, [sp], #16       ; Restore frame pointer and link register
ret
