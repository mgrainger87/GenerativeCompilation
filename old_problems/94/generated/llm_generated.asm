    .globl _customFunction
    .align 2
_customFunction:
    // Subtract 8 from int2 and store in temp
    sub x4, x1, #8       // x4 = int2 - 8

    // Assign temp to a and b
    mov x5, x4           // x5 = temp
    mov x6, x5           // x6 = a

    // Dereference outInt and assign b's value
    str x6, [x2]

    // Load the floating-point constant 1.4 into d2
    ldr x7, =0x3ff6666666666666  // Load double precision representation of 1.4
    fmov d2, x7          // Move the integer representation to the floating-point register

    // Multiply double2 by 1.4 and store in tempD
    fmul d3, d1, d2      // d3 = double2 * 1.4

    // Assign tempD to x and y
    fmov d4, d3          // d4 = tempD
    fmov d5, d4          // d5 = x

    // Dereference outDouble and assign y's value
    str d5, [x3]

    ret
