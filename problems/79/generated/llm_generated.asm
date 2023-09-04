    .global _customFunction
    .align  2

_customFunction:
    // int i = 0;
    mov     w4, #0

1:  // Compare i with 2
    cmp     w4, #2
    b.ge    2f

    // *outInt = int1 * 2;
    lsl     w5, w0, #1          // w5 = int1 * 2
    str     w5, [x2]            // store w5 to *outInt

    // i++
    add     w4, w4, #1
    b       1b

2:  // Return
    ret
