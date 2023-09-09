	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 
	.p2align	2
_customFunction:                        
	.cfi_startproc

    ; Unrolled loop
    str     d1, [x3]           ; Store double2 value to outDouble
    str     d1, [x3]           ; Store double2 value to outDouble again

    ret
	.cfi_endproc
