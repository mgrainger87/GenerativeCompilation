//solution_number=5,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Save x29, x30 (frame pointer and link register) on the stack
stp	x29, x30, [sp, #-16]!
mov	x29, sp

1:  ; Loop start
; Check if int1 (w0) is 100
cmp	w0, #100
b.eq	3f

; Check if int1 (w0) is less than int2 (w1)
cmp	w0, w1
csel w8, w0, w1, lt  ; w8 = (w0 < w1) ? w0 : w1
csel w9, w1, w0, lt  ; w9 = (w0 < w1) ? w1 : w0
add	w8, w8, #5
subs	w9, w9, #5
mov w0, w8
mov w1, w9
b	1b

3:  ; If int1 == 100, store int2 (w1) to *outInt (x2)
str	w1, [x2]

; Restore x29, x30 and return
ldp	x29, x30, [sp], #16
ret

.cfi_endproc
.subsections_via_symbols
