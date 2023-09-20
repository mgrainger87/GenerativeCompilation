//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=2
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

sub	sp, sp, #80
.cfi_def_cfa_offset 80
stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
add	x29, sp, #64
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16
str	x2, [sp, #32]
str	x3, [sp, #24]

; Load constants once before entering the loop
fmov	d1, #2.00000000
fmov	d2, #1.00000000

LoopStart:
; Calculate temp = double1 * 2
fmul	d0, d0, d1

; Calculate sum = int1 + int2
add	w9, w0, w1  ; Preserve the sum in w9

; Check if sum is less than 20
subs	w8, w9, #20
cset	w8, ge
tbnz	w8, #0, LoopContinue
; If sum < 20, then multiply by 3 and exit
mov	w10, #3
mul	w9, w9, w10
ldr	x10, [sp, #32]
str	w9, [x10]
b	Exit

LoopContinue:
; Prepare arguments for the next iteration
mov	w0, w1
mov	w1, w9
fadd	d1, d1, d2
b	LoopStart

Exit:
ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
add	sp, sp, #80
ret
.cfi_endproc
.subsections_via_symbols
