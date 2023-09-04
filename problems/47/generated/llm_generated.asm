.global _customFunction
.section __DATA,.data
.align 3
.double_const: 
    .double 1.5

.text
.align 2
_customFunction:
    // *outInt = int1 * (int2 + 3)
    add w4, w1, #3          // w4 = int2 + 3
    mul w4, w0, w4          // w4 = int1 * (int2 + 3)
    str w4, [x2]            // *outInt = w4

    // *outDouble = double1 * (double2 + 1.5)
    adrp x4, .double_const@PAGE       // x4 = page address of 1.5
    ldr  d2, [x4, .double_const@PAGEOFF] // d2 = 1.5
    fadd d2, d1, d2         // d2 = double2 + 1.5
    fmul d2, d0, d2         // d2 = double1 * (double2 + 1.5)
    str  d2, [x3]           // *outDouble = d2

    ret
