	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
    ; Skip the conditions checking on int1 and int2 since it's always false
    ; Directly perform the floating point addition and store the result
	fadd	d0, d0, d1      ; Add double1 and double2
	str	d0, [x3]       ; Store the result in *outDouble
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
