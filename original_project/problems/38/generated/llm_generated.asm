    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    3
_customFunction:
    // *outInt = int1 * int2;
    mul w4, w0, w1       ; w4 = int1 * int2
    str w4, [x2]         ; Store w4 to the address pointed to by x2 (outInt)

    // *outInt = int1 + int2;
    add w4, w0, w1       ; w4 = int1 + int2
    str w4, [x2]         ; Store w4 to the address pointed to by x2 (outInt)

    // *outDouble = double1 + double2;
    fadd d4, d0, d1      ; d4 = double1 + double2
    str d4, [x3]         ; Store d4 to the address pointed to by x3 (outDouble)

    ret
