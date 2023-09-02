	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                     
	.cfi_startproc

    ; Calculate *outInt = int1 * 2 + int2 * 3 + 10
    add     x0, x0, x0            ; int1 * 2
    add     x1, x1, x1, lsl #1    ; int2 * 3
    add     x0, x0, x1            ; int1 * 2 + int2 * 3
    add     x0, x0, #10           ; int1 * 2 + int2 * 3 + 10
    str     w0, [x4]

    ; Calculate *outDouble = double1 + double2 + 5.5
    fmov    d2, #5.50000000
    fadd    d0, d0, d1
    fadd    d0, d0, d2
    str     d0, [x5]

    ret
    .cfi_endproc

.subsections_via_symbols
