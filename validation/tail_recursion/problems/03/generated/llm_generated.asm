    .globl  _customFunction
    .align  2
_customFunction:
    // Check if int2 (x1) is 1
    cmp     x1, #1
    b.ne    1f

    // If int2 is 1, store int1 into *outInt and return
    str     w0, [x2]
    ret

1:  // Prepare arguments for the next iteration (tail recursion)
    add     w0, w0, w0      // x0 = int1 + int1
    sub     w1, w1, #1      // x1 = int2 - 1

    // Jump to the start of the function (instead of making a recursive call)
    b       _customFunction
