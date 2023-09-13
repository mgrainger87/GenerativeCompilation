.global _customFunction
_customFunction:
    stp x29, x30, [sp, #-16]!    ; Store frame pointer and link register
    mov x29, sp                 ; Set frame pointer

    mov w4, wzr                 ; w4 = 0 (Loop counter 'i')
    fmov d2, #0.0               ; d2 = result = 0.0

1:                              ; Loop label
    cmp w4, #5                  ; Compare i with 5
    b.ge 2f                     ; If i >= 5, branch to end of loop

    fadd d2, d2, d0             ; result += double1
    add w4, w4, #1              ; i++
    b 1b                        ; Branch to start of loop

2:                              ; End of loop label
    str w1, [x2]                ; *outInt = int2
    str d2, [x3]                ; *outDouble = result

    ldp x29, x30, [sp], #16     ; Restore frame pointer and link register
    ret                         ; Return
