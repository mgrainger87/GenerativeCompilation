.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction          ; -- Begin function customFunction
.p2align	2
_customFunction:                ; @customFunction
    .cfi_startproc
    ; No need to adjust the stack pointer or store values to stack since we are not using them.

    ; Since the loop does the same thing twice, we only need to do the operation once.
    str	w1, [x2]  ; Store the value of int2 to *outInt

    ; Restore the stack and return
    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
