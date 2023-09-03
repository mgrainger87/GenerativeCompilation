	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 
	.p2align	2
_customFunction:                        
	.cfi_startproc
; %bb.0:
    ; int a = int1;
	mov	w8, w0

    ; a += int2;
	add	w8, w8, w1

    ; *outInt = int2;
	str	w1, [x2]

    ; *outDouble = double1 + double2;
	fadd	d0, d0, d1
	str	d0, [x3]

	ret
	.cfi_endproc
.subsections_via_symbols
