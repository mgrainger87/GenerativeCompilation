    .section    __TEXT,__text,regular,pure_instructions
    .align      2
    .globl      _customFunction
    .p2align    3
_customFunction:
    // *outInt = int1 * 1 + 0;
    // which is simply storing int1 into the location pointed by outInt
    str     x0, [x2]     // Store int1 (x0) at the address pointed to by outInt (x2)

    // *outDouble = double1 * 1.0 + 0.0;
    // which is simply storing double1 into the location pointed by outDouble
    str     d0, [x3]     // Store double1 (d0) at the address pointed to by outDouble (x3)

    ret                  // Return from function
