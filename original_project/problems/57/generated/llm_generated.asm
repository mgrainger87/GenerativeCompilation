.global _customFunction
.align 2
_customFunction:
    ; Load constants for multiplication
    mov x4, #6
    mov x5, #2
    
    ; Multiplication for int1
    mul x6, x0, x4    ; int1 * 6
    mul x7, x0, x5    ; int1 * 2
    sub x6, x6, x7    ; (int1 * 6) - (int1 * 2)
    str x6, [x2]      ; Store to *outInt
    
    ; Load floating-point constants
    fmov d2, #7.0
    fmov d3, #3.0
    
    ; Multiplication and subtraction for double1
    fmul d4, d0, d2
    fmul d5, d0, d3
    fsub d4, d4, d5
    str d4, [x3]      ; Store to *outDouble

    ret
