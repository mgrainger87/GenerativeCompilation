//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:

; int a = int1; and int b = a; can be combined as:
; No need to use stack for temporary storage of w0 since it's just being assigned back.
str    w0, [x2]          ; *outInt = b;

; double x = double1; and double y = x; can be combined as:
; No need to use stack for temporary storage of d0 since it's just being assigned back.
str    d0, [x3]          ; *outDouble = y;

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
