//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc

; Loop for int1 times (every other iteration, since only even i is of interest)
mov    w8, #0                   ; w8 is our loop counter 'i'
.loop_start:
cmp    w8, w0                   ; Comparing i and int1
b.ge    .loop_end               ; If i >= int1, exit loop

add    w9, w0, w1               ; w9 = int1 + int2
str    w9, [x2]                 ; Storing value to outInt
add    w8, w8, #2               ; Incrementing loop counter 'i' by 2
b    .loop_start

.loop_end:
sub    w8, w0, w1               ; w8 = int1 - int2
str    w8, [x2]                 ; Storing value to outInt

; Setting value of outDouble to double1 + double2
fadd    d0, d0, d1
str    d0, [x3]                 ; Storing sum to outDouble

; Cleanup and return
ret
.cfi_endproc
