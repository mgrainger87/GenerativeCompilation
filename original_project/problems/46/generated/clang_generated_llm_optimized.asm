    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:                        
    .cfi_startproc

    ; Compute \( \text{int1} \times \text{int2} + \text{int1} \)
    mul    w8, w0, w1
    add    w8, w8, w0
    str    w8, [x2]

    ; Compute \( \text{double1} \times \text{double2} + \text{double1} \)
    fmadd    d0, d0, d1, d0
    str    d0, [x3]

    ret
    .cfi_endproc
.subsections_via_symbols
