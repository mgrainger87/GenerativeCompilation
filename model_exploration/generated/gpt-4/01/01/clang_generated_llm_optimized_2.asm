//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=1
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
; No need to save anything on the stack as we aren't calling any other functions
; and we are only manipulating the arguments.
str	w0, [x2] ; Store int1 to the address in outInt.
ret
.cfi_endproc
.subsections_via_symbols
