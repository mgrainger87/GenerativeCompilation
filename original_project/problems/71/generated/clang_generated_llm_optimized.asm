    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:                     
    .cfi_startproc

    ; No need to subtract from the stack pointer since we're not using any local storage.
    ; The function is also not calling any other functions, so we don't need to manage x30 (link register).

    ; Load int1 from x0 and store it at the location pointed by outInt (x2)
    str    w0, [x2]
    
    ; The loop essentially writes int1 to outInt twice, so we just repeat the above instruction.
    str    w0, [x2]
    
    ret
    .cfi_endproc

.subsections_via_symbols
