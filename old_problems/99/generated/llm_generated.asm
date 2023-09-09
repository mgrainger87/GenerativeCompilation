    .section __TEXT,__text,regular,pure_instructions
    .globl _customFunction
    .align 3
_customFunction:
    // int a = int1 * 9;
    mov w4, #9
    mul w4, w4, w0 // result in w4

    // int b = a;
    mov w5, w4

    // *outInt = b;
    str w5, [x2]

    // Load the constant 1.9 into d5
    adrp x5, .Ldouble_constant@PAGE
    ldr  d5, [x5, .Ldouble_constant@PAGEOFF]

    // double x = double1 * 1.9;
    fmul d7, d0, d5 // result in d7

    // double y = x;
    fmov d8, d7

    // *outDouble = y;
    str d8, [x3]

    ret

    // Ensure 8-byte alignment for the double constant
    .align 3
.Ldouble_constant:
    .double 1.9
