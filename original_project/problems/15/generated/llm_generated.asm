    .global _customFunction
    .align 2
_customFunction:
    // int base = int1 * 2 + int2 / 2;
    lsl x4, x0, #1           // x4 = int1 * 2
    asr x5, x1, #1           // x5 = int2 / 2
    add x4, x4, x5           // x4 = base

    // if (base > 10)
    cmp x4, #10
    ble .else_branch

    // *outInt = base + int1 - int2;
    add x5, x4, x0           // x5 = base + int1
    sub x5, x5, x1           // x5 = base + int1 - int2
    str x5, [x2]             // store x5 to *outInt
    b .after_if

.else_branch:
    // *outInt = base - int1 + int2;
    sub x5, x4, x0           // x5 = base - int1
    add x5, x5, x1           // x5 = base - int1 + int2
    str x5, [x2]             // store x5 to *outInt

.after_if:
    // *outDouble = double1 + double2;
    fadd d4, d0, d1          // d4 = double1 + double2
    str d4, [x3]             // store d4 to *outDouble

    ret
