//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
add w4, w0, w1          // Add int1 and int2
cmp w4, #100            // Compare result to 100

ble 1f                  // If result <= 100, jump to else block

// true block
mov w5, #100            // Load 100 into w5
str w5, [x2]            // Store w5 to *outInt

fmul d2, d0, d1         // Multiply double1 and double2
str d2, [x3]            // Store result to *outDouble
ret

1:  // else block
str w4, [x2]            // Store w4 (sum of int1 and int2) to *outInt

fadd d2, d0, d1         // Add double1 and double2
str d2, [x3]            // Store result to *outDouble
ret
