.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction: 
	.cfi_startproc

    ; Multiply int1 (in w0) by 2
    lsl	w8, w0, #1
    
    ; Store the result in *outInt
    str	w8, [x2]

    ; Return from the function
    ret

    .cfi_endproc
