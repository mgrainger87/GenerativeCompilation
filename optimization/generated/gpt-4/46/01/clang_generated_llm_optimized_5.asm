//solution_number=5,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
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
add	w4, w0, w1  ; Preserve the sum in w4

; Check if sum is less than 20
subs	w3, w4, #20
b.ge	LoopContinue

; If sum < 20, then multiply by 3 and exit
lsl	w5, w4, #1  ; 2x
add	w4, w4, w5  ; 2x + x
str	w4, [x2]
b	Exit

LoopContinue:
; Prepare arguments for the next iteration
mov	w0, w1
add	w1, w1, w4
fadd	d1, d1, d4
b	LoopStart

Exit:
ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
add	sp, sp, #32
ret
.cfi_endproc
.subsections_via_symbols
