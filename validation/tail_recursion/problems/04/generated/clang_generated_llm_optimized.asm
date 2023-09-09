.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
.cfi_def_cfa_offset 16
stp	x29, x30, [sp, #-16]!           ; Store FP and LR to stack
mov	x29, sp                       ; Set up frame pointer
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16

fcmp	d1, #0.0                      ; Compare double2 with 0.0
b.ne	1f                           ; Branch if not equal to zero

str	d0, [x3]                      ; Store double1 to *outDouble
b	2f                           ; Jump to function end

1:                                      ; Recursive call label
fmov	d2, #1.00000000               ; Load constant 1.0 into d2
fadd	d0, d0, d2                   ; double1 + 1.0
fsub	d1, d1, d2                   ; double2 - 1.0
bl	_customFunction               ; Recursive call

2:                                      ; End label
ldp	x29, x30, [sp], #16            ; Restore FP and LR, and adjust stack
ret
.cfi_endproc
