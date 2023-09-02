    .section    __TEXT,__text,regular,pure_instructions
    .globl    _helperFunction
    .align    2
_helperFunction:
    mov    x0, #0             // x * 0 is always 0
    ret

    .globl    _customFunction
    .align    2
_customFunction:
    // Preserve the link register (lr) into x9
    mov    x9, lr

    // Call helperFunction(int1)
    bl    _helperFunction

    // Restore the link register (lr) from x9
    mov    lr, x9
    
    // Add 5 to the result
    add    x0, x0, #5

    // Store the result to *outInt
    str    w0, [x4]

    // Compute the sum of double1 and double2
    fadd   d0, d0, d1

    // Store the result to *outDouble
    str    d0, [x5]

    ret
