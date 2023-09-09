    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:
    .cfi_startproc
    ; Initialization: Set the starting value to int1 (x0)
    str w0, [x2]               ; *outInt = int1

    ; Check if the loop needs to be executed
    cbz x0, .LBB0_6

    ; Compute int1 + int2 once and store in w8
    add w8, w0, w1

    ; Initialize loop counter to 0 in w9
    mov w9, #0

.LBB0_1:
    ; Check if counter is even
    and w10, w9, #1
    cbz w10, .LBB0_3

    ; Increment loop counter
    add w9, w9, #1

    ; Check loop condition
    cmp w9, w0
    b.lt .LBB0_1

    ; Exit the loop
    b .LBB0_6

.LBB0_3:
    ; Store int1 + int2 to *outInt if i is even
    str w8, [x2]

    ; Increment loop counter by 2 (since we only need to check even numbers)
    add w9, w9, #2

    ; Check loop condition
    cmp w9, w0
    b.lt .LBB0_1

.LBB0_6:
    ; Compute int1 - int2
    sub w0, w0, w1

    ; Store result to *outInt
    str w0, [x2]

    ; Compute double1 + double2 and store in *outDouble
    fadd d0, d0, d1
    str d0, [x3]

    ret
    .cfi_endproc
