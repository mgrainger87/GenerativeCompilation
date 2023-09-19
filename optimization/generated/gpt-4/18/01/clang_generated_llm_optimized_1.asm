//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc

; Initialization
sub    sp, sp, #32                ; Allocating stack space for local variables
.cfi_def_cfa_offset 32
stp    x2, x3, [sp, #16]         ; Storing outInt and outDouble pointers to stack

; Setting initial value of outInt to int1
str    w0, [x2]

; Loop for int1 times
mov    w8, #0                   ; w8 is our loop counter 'i'
.loop_start:
cmp    w8, w0                   ; Comparing i and int1
b.ge    .loop_end               ; If i >= int1, exit loop

and    w9, w8, #1               ; Using bitwise AND to determine if i is even or odd
cbz    w9, .even_action         ; If i is even (i % 2 == 0), jump to even_action

; Continue loop iteration
.loop_continue:
add    w8, w8, #1               ; Incrementing loop counter 'i'
b    .loop_start

; Action when i is even
.even_action:
add    w9, w0, w1               ; w9 = int1 + int2
str    w9, [x2]                 ; Storing value to outInt
b    .loop_continue             ; Continue to next loop iteration

.loop_end:
sub    w8, w0, w1               ; w8 = int1 - int2
str    w8, [x2]                 ; Storing value to outInt

; Setting value of outDouble to double1 + double2
fadd    d0, d0, d1
str    d0, [x3]                 ; Storing sum to outDouble

; Cleanup and return
add    sp, sp, #32               ; Reclaiming stack space
ret
.cfi_endproc
