//compiler_errors=4,linker_errors=1,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register (return address) and allocate space on the stack
stp x30, xzr, [sp, #-16]!

// Compare int1 to 10
cmp w0, #10
// If int1 <= 10, jump to the else block for int operations
ble 1f

// then block: int1 * int2
mul w4, w0, w1
str w4, [x2]   // store result at outInt
b 2f           // jump to floating point operations

1:  // else block: int1 + int2
add w4, w0, w1
str w4, [x2]   // store result at outInt

2:  // Load 5.0 into a floating point register using GOT mechanism
adrp x4, five_point_zero@GOTPAGE
ldr x4, [x4, five_point_zero@GOTPAGEOFF]
ldr d4, [x4]
// Compare double2 to 5.0
fcmp d1, d4
// If double2 >= 5.0, jump to the else block for floating point operations
bge 4f

// then block: store double1 at outDouble
str d0, [x3]
b 5f           // jump to function end

4:  // else block: store double2 at outDouble
str d1, [x3]

5:  // Restore link register and return
ldp x30, xzr, [sp], #16
ret

.section __DATA,__data
five_point_zero: .double 5.0
