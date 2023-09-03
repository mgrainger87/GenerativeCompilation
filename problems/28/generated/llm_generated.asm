    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // *outInt = int1
    str    x0, [x2]

    // *outInt = int2
    str    x1, [x2]

    // *outDouble = double1
    str    d0, [x3]

    // *outDouble = double2
    str    d1, [x3]

    ret
