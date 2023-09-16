; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp3ddwgw17.asm:8:9: error: expected compatible register or logical immediate
; mov w4, x1
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Function prologue
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp               // Set frame pointer

// *outInt = (int2 % 3 == 0) ? int1 * int1 : int2 * int2;
mov w4, x1                // Copy int2 to w4
and w4, w4, #2            // mod 3 by masking with binary 10 (equivalent to % 3)
cbnz w4, .Lnot_divisible

// If int2 % 3 == 0
mul w5, w0, w0            // int1 * int1
str w5, [x2]              // Store result to *outInt
b .Ldouble_calculation

.Lnot_divisible:
mul w5, w1, w1            // int2 * int2
str w5, [x2]              // Store result to *outInt

.Ldouble_calculation:
// *outDouble = (double1 == double2) ? 0.0 : double1 + double2;
fcmp d0, d1               // Compare double1 and double2
beq .Ldouble_equal

// If double1 != double2
fadd d2, d0, d1           // double1 + double2
str d2, [x3]              // Store result to *outDouble
b .Lend

.Ldouble_equal:
fmov d2, #0.0             // Load immediate 0.0 to d2
str d2, [x3]              // Store 0.0 to *outDouble

.Lend:
// Function epilogue
ldp x29, x30, [sp], #16   // Restore frame pointer and link register
ret                       // Return
