	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function customFunction
lCPI0_0:
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	cmp	w0, #1
	b.lt	LBB0_20
; %bb.1:
	cmp	w1, #1
	b.lt	LBB0_20
; %bb.2:
	add	w8, w1, w0
	cmp	w1, #16
	b.hs	LBB0_9
; %bb.3:
	mov	w9, #0
	b	LBB0_5
LBB0_4:                                 ;   in Loop: Header=BB0_5 Depth=1
	add	w9, w9, #1
	cmp	w9, w0
	b.eq	LBB0_20
LBB0_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
	mov	w10, #0
	b	LBB0_7
LBB0_6:                                 ;   in Loop: Header=BB0_7 Depth=2
	add	w10, w10, #1
	cmp	w1, w10
	b.eq	LBB0_4
LBB0_7:                                 ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	tbz	w10, #0, LBB0_6
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=2
	str	w8, [x2]
	b	LBB0_6
LBB0_9:
	mov	w9, #0
	and	w10, w1, #0xfffffff0
Lloh0:
	adrp	x11, lCPI0_0@PAGE
Lloh1:
	ldr	q2, [x11, lCPI0_0@PAGEOFF]
	movi.4s	v3, #16
	b	LBB0_11
LBB0_10:                                ;   in Loop: Header=BB0_11 Depth=1
	add	w9, w9, #1
	cmp	w9, w0
	b.eq	LBB0_20
LBB0_11:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_13 Depth 2
                                        ;     Child Loop BB0_18 Depth 2
	mov	x11, x10
	mov.16b	v4, v2
	b	LBB0_13
LBB0_12:                                ;   in Loop: Header=BB0_13 Depth=2
	add.4s	v4, v4, v3
	subs	w11, w11, #16
	b.eq	LBB0_15
LBB0_13:                                ;   Parent Loop BB0_11 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	xtn.4h	v5, v4
	umov.h	w12, v5[0]
	umov.h	w13, v5[1]
	and	w13, w13, #0x1
	bfi	w12, w13, #1, #1
	umov.h	w13, v5[2]
	and	w13, w13, #0x1
	bfi	w12, w13, #2, #1
	umov.h	w13, v5[3]
	bfi	w12, w13, #3, #29
	tst	w12, #0xf
	b.eq	LBB0_12
; %bb.14:                               ;   in Loop: Header=BB0_13 Depth=2
	str	w8, [x2]
	b	LBB0_12
LBB0_15:                                ;   in Loop: Header=BB0_11 Depth=1
	cmp	w10, w1
	b.eq	LBB0_10
; %bb.16:                               ;   in Loop: Header=BB0_11 Depth=1
	mov	x11, x10
	b	LBB0_18
LBB0_17:                                ;   in Loop: Header=BB0_18 Depth=2
	add	w11, w11, #1
	cmp	w1, w11
	b.eq	LBB0_10
LBB0_18:                                ;   Parent Loop BB0_11 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	tbz	w11, #0, LBB0_17
; %bb.19:                               ;   in Loop: Header=BB0_18 Depth=2
	str	w8, [x2]
	b	LBB0_17
LBB0_20:
	fadd	d0, d0, d1
	str	d0, [x3]
	add	sp, sp, #16
	ret
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
