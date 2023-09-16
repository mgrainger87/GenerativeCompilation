	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function customFunction
lCPI0_0:
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.long	4                               ; 0x4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	w8, #1
	str	w8, [x2]
	cmp	w0, #1
	b.lt	LBB0_9
; %bb.1:
	cmp	w0, #16
	b.hs	LBB0_3
; %bb.2:
	mov	w10, #1
	mov	w8, #1
	b	LBB0_6
LBB0_3:
	and	w9, w0, #0xfffffff0
	movi.4s	v0, #1
	movi.4s	v1, #4
Lloh0:
	adrp	x8, lCPI0_0@PAGE
Lloh1:
	ldr	q2, [x8, lCPI0_0@PAGEOFF]
	orr	w8, w9, #0x1
	movi.4s	v3, #8
	movi.4s	v4, #12
	movi.4s	v5, #16
	mov	x10, x9
	movi.4s	v6, #1
	movi.4s	v7, #1
	movi.4s	v16, #1
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	add.4s	v17, v2, v1
	add.4s	v18, v2, v3
	add.4s	v19, v2, v4
	mul.4s	v0, v0, v2
	mul.4s	v6, v6, v17
	mul.4s	v7, v7, v18
	mul.4s	v16, v16, v19
	add.4s	v2, v2, v5
	subs	w10, w10, #16
	b.ne	LBB0_4
; %bb.5:
	mul.4s	v0, v6, v0
	mul.4s	v0, v7, v0
	mul.4s	v0, v16, v0
	ext.16b	v1, v0, v0, #8
	mul.2s	v0, v0, v1
	fmov	w10, s0
	mov.s	w11, v0[1]
	mul	w10, w10, w11
	cmp	w9, w0
	b.eq	LBB0_8
LBB0_6:
	add	w9, w0, #1
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	mul	w10, w10, w8
	add	w8, w8, #1
	cmp	w9, w8
	b.ne	LBB0_7
LBB0_8:
	str	w10, [x2]
LBB0_9:
	str	xzr, [x3]
	ret
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
