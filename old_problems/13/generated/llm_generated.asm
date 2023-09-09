    .section __TEXT,__text,regular,pure_instructions
    .align 2
    .globl _customFunction
    .p2align 2
_customFunction:
    // int1 is in x0, int2 is in x1
    // double1 is in d0, double2 is in d1
    // outInt is in x2, outDouble is in x3
    
    // Calculate part1 = int1 * int2 + int1 - int2
    mul x4, x0, x1          // x4 = int1 * int2
    add x4, x4, x0          // x4 = x4 + int1
    sub x4, x4, x1          // x4 = x4 - int2 (x4 now contains part1)
    
    // Calculate part2 = int1 * int2 - int1 + int2
    mul x5, x0, x1          // x5 = int1 * int2
    sub x5, x5, x0          // x5 = x5 - int1
    add x5, x5, x1          // x5 = x5 + int2 (x5 now contains part2)
    
    // Calculate *outInt = part1 + part2 - int1 * int2
    add x6, x4, x5          // x6 = part1 + part2
    mul x7, x0, x1          // x7 = int1 * int2
    sub x6, x6, x7          // x6 = x6 - x7
    str x6, [x2]            // Store x6 to *outInt
    
    // Calculate *outDouble = double1 + double2
    fadd d2, d0, d1         // d2 = double1 + double2
    str d2, [x3]            // Store d2 to *outDouble
    
    ret                     // Return
