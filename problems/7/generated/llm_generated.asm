    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    ; Multiplication of int1 and int2
    mul    x4, x0, x1

    ; Store result to *outInt
    str    x4, [x2]

    ; Multiplication of double1 and double2
    fmul   d2, d0, d1

    ; Store result to *outDouble
    str    d2, [x3]

    ; Return
    ret
