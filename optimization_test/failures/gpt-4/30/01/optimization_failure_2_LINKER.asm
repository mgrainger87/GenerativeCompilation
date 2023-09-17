; compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: final section layout:
;     __TEXT/__text addr=0x10000393C, size=0x000004D0, fileOffset=0x0000393C, type=1
;     __TEXT/__stubs addr=0x100003E0C, size=0x0000003C, fileOffset=0x00003E0C, type=29
;     __TEXT/__const addr=0x100003E48, size=0x00000008, fileOffset=0x00003E48, type=0
;     __TEXT/__cstring addr=0x100003E50, size=0x00000153, fileOffset=0x00003E50, type=13
;     __TEXT/__unwind_info addr=0x100003FA4, size=0x00000058, fileOffset=0x00003FA4, type=22
;     __DATA_CONST/__got addr=0x100004000, size=0x00000028, fileOffset=0x00004000, type=31
; ld: 32-bit absolute address out of range (0x100003958 max is 4GB): from d_const_2 + 0x00000008 (0x100003958) to d_const_2 (0x100003958) in 'd_const_2' from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp70lbzywc.o for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc

; Calculate int1 * 3
lsl	w8, w0, #1     ; w8 = int1 * 2
add	w8, w8, w0    ; w8 = w8 + int1 = int1 * 3
str	w8, [x2]

; Load 2.0 from constant pool into d1
ldr	d1, =d_const_2

; Calculate double1 * 2 using constant from d1
fmul	d0, d0, d1
str	d0, [x3]

ret
.cfi_endproc

.p2align	2
d_const_2:
.double	2.00000000
