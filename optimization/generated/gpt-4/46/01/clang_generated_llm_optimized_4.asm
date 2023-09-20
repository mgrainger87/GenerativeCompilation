//solution_number=4,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

sub	sp, sp, #32
.cfi_def_cfa_offset 32
stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
add	x29, sp, #16
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16

; Load constants once before entering the loop
fmov	d3, #2.00000000
fmov	d4, #1.00000000

LoopStart:
; Calculate temp = double1 * 2
fmul	d0, d0, d3

; Calculate sum = int1 + int2
add	w3, w0, w1  ; Preserve the sum in w3

; Check if sum is less than 20
subs	w4, w3, #20
cset	w4, ge
tbnz	w4, #0, LoopContinue

; If sum < 20, then multiply by 3 and exit
lsl	w5, w3, #1  ; 2x
add	w3, w3, w5  ; 2x + x
str	w3, [x2]
b	Exit

LoopContinue:
; Prepare arguments for the next iteration
mov	w0, w1
mov	w1, w3
fadd	d1, d1, d4
b	LoopStart

Exit:
ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
add	sp, sp, #32
ret
.cfi_endproc
.subsections_via_symbols
