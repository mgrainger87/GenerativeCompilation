    .globl  _customFunction
    .p2align    3
_customFunction:
    // int tmp1 = int1 * 2;
    lsl x4, x0, #1      // tmp1 = int1 << 1 (equivalent to int1 * 2)

    // int tmp2 = int2 - 5;
    sub x5, x1, #5      // tmp2 = int2 - 5

    // int tmp3 = int1 + int2;
    add x6, x0, x1      // tmp3 = int1 + int2

    // *outInt = tmp3;
    str x6, [x2]        // Store tmp3 into outInt

    // double tmpDouble1 = double1 / 2;
    fmov d2, #2.0       // Load constant value 2.0 into d2
    fdiv d3, d0, d2     // tmpDouble1 = double1 / 2

    // double tmpDouble2 = double2 * 3;
    fmov d4, #3.0       // Load constant value 3.0 into d4
    fmul d5, d1, d4     // tmpDouble2 = double2 * 3

    // *outDouble = double1 + double2;
    fadd d6, d0, d1     // d6 = double1 + double2
    str  d6, [x3]       // Store d6 into outDouble

    ret                 // Return from the function
