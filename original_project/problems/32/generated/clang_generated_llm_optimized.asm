    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:
    .cfi_startproc

    ; Loop for int i = 0; i < int1; i++
    mov    w4, wzr                      ; w4 is our counter 'i'
1:                                      ; Begin of the loop
    cmp    w4, w0
    b.ge    2f                          ; Exit loop if i >= int1
    mul    w5, w0, w1                   ; w5 = int1 * int2
    str    w5, [x2]
    add    w4, w4, #1
    b    1b                            ; Jump back to the start of the loop

2:                                     
    add    w5, w0, w1                  ; w5 = int1 + int2
    str    w5, [x2]

    ; Loop for int j = 0; j < int2; j++
    mov    w4, wzr                      ; w4 is our counter 'j'
3:                                      ; Begin of the loop
    cmp    w4, w1
    b.ge    4f                          ; Exit loop if j >= int2
    fmov    d3, #2.0                    ; Load 2.0 into d3
    fmul    d2, d0, d3                  ; Using d2 to store the result of double1 * 2
    add    w4, w4, #1
    b    3b                            ; Jump back to the start of the loop

4:                                      
    fadd    d2, d0, d1
    str    d2, [x3]

    ret
    .cfi_endproc
