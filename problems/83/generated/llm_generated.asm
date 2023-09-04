.global _customFunction
.balign 4
_customFunction:
    // Multiply int1 by 2
    add x0, x0, x0

    // Store result in *outInt
    str w0, [x2]

    // Load 0.5 into a floating point register
    adrp x4, .Ldouble_half@PAGE
    ldr  d4, [x4, .Ldouble_half@PAGEOFF]

    // Multiply double1 by 0.5
    fmul d0, d0, d4

    // Store result in *outDouble
    str d0, [x3]

    ret

.balign 8
.Ldouble_half:
    .double 0.5
