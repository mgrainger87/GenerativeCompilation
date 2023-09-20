//solution_number=1,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.section	__TEXT,__literal8,8byte_literals
.p2align	3
lCPI0_0:
.quad	0x4049000000000000              ; double 50
lCPI0_1:
.quad	0x4020000000000000              ; double 10
.quad	0x4000000000000000              ; double 2
.quad	0x4014000000000000              ; double 5

.section	__TEXT,__text,regular,pure_instructions
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

// Save frame pointer and link register
sub	sp, sp, #64
stp	x29, x30, [sp, #48]
add	x29, sp, #48

// Save parameters
stur	w0, [x29, #-4]
stur	w1, [x29, #-8]
stur	d0, [x29, #-16]
str	d1, [sp, #24]
str	x2, [sp, #16]
str	x3, [sp, #8]

loop_start:

// Check if double2 > 50.0
ldr	d0, [sp, #24]
adrp	x8, lCPI0_0@PAGE
ldr	d1, [x8, lCPI0_0@PAGEOFF]
fcmp	d0, d1
b.le	L1

// Set outDouble to double1
ldur	d0, [x29, #-16]
ldr	x8, [sp, #8]
str	d0, [x8]
b	exit_function

L1:

// Check if double2 < 10.0
ldr	d0, [sp, #24]
adrp	x8, lCPI0_1@PAGE
ldr	d1, [x8, lCPI0_1@PAGEOFF]
fcmp	d0, d1
b.pl	L2

// Branch if double2 < 10.0
ldur	w8, [x29, #-8]
add	w1, w8, #1
ldur	d0, [x29, #-16]
ldr	d1, [x8, lCPI0_1@PAGEOFF+8]
fadd	d0, d0, d1
ldr	d1, [sp, #24]
ldr	d2, [x8, lCPI0_1@PAGEOFF+16]
fadd	d1, d1, d2
b	loop_start

L2:

// Branch if double2 >= 10.0
ldur	w8, [x29, #-8]
add	w1, w8, #2
ldur	d0, [x29, #-16]
ldr	d1, [x8, lCPI0_1@PAGEOFF+8]
fsub	d0, d0, d1
ldr	d1, [sp, #24]
ldr	d2, [x8, lCPI0_1@PAGEOFF+24]
fadd	d1, d1, d2
b	loop_start

exit_function:

// Restore frame pointer and link register
ldp	x29, x30, [sp, #48]
add	sp, sp, #64
ret

.cfi_endproc
.subsections_via_symbols
