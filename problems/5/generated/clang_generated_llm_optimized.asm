    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
    ; Save lr, x29 (frame pointer), x2 and x3 since we're calling another function
    stp    x30, x29, [sp, #-32]!
    stp    x2, x3, [sp, #16]
    
    ; Call power(int1, 1)
    mov    w1, #1
    bl    _power
    ; Restore x2 and x3 and Store result to *outInt
    ldp    x2, x3, [sp, #16]
    str    w0, [x2]
    
    ; Call power(double1, 0)
    fcvtzs    w0, d0
    mov    w1, #0
    bl    _power
    ; Convert the integer result to double and store to *outDouble
    scvtf    d0, w0
    str    d0, [x3]
    
    ; Restore lr, x29 and return
    ldp    x30, x29, [sp], #32
    ret
    .cfi_endproc
                                        ; -- End function

    .p2align    2                               ; -- Begin function power
_power:                                 ; @power
    .cfi_startproc
    mov    w2, #1                          ; result = 1
    cbz    w1, 1f                          ; If exp is 0, return immediately
.Lloop_start:
    mul    w2, w2, w0                      ; result *= base
    subs    w1, w1, #1                     ; Decrement exp
    b.ne    .Lloop_start                   ; If exp is not 0, repeat
1:
    mov    w0, w2                          ; Move the result to w0 for return
    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
