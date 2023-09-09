    .global _customFunction
    .align 2

_customFunction:
    // *outInt = int1 / 1;
    str w0, [x2]       // store the value of int1 directly to memory pointed by outInt

    // *outDouble = double1 / 1.0;
    str d0, [x3]       // store the value of double1 directly to memory pointed by outDouble

    ret                // return from function
