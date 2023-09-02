    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // product = int1 * int2;
    // x0 contains int1 and x1 contains int2
    mul    x4, x0, x1    // store the result in x4

    // *outInt = product + product;
    add    x5, x4, x4    // add product to itself, store in x5
    str    x5, [x2]    // store the result at the address in x2

    // *outDouble = double1 + double2;
    // d0 contains double1 and d1 contains double2
    fadd    d2, d0, d1    // add double1 to double2, store in d2
    str    d2, [x3]    // store the result at the address in x3

    ret
