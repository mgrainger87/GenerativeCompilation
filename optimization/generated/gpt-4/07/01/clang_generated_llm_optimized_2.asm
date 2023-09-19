//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc

; Compute multiplication result once
mul    w5, w0, w1

; Compute part1 = int1 * int2 + int1 - int2;
add    w4, w5, w0
sub    w4, w4, w1

; Compute part2 = int1 * int2 - int1 + int2;
sub    w6, w5, w0
add    w6, w6, w1

; Compute *outInt = part1 + part2 - int1 * int2;
add    w4, w4, w6
sub    w4, w4, w5
str    w4, [x2]

; Compute *outDouble = double1 + double2;
fadd    d0, d0, d1
str    d0, [x3]

ret
.cfi_endproc
