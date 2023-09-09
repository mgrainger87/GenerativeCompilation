    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc

    ; Check if int2 (in w1) is equal to 1
    subs    w1, w1, #1
    beq     store_and_return

    ; Left shift w0 (int1) by w1 (int2-1) places, effectively multiplying int1 by 2^(int2-1)
    lsl     w0, w0, w1

store_and_return:
    ; Store int1 to the location pointed by outInt
    str    w0, [x2]
    ret

    .cfi_endproc
