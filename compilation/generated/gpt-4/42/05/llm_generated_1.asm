//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
.align	3
_helperFunction:
fmul	d0, d0, d1
ret

.global _customFunction
.align	3
_customFunction:
stp	x30, xzr, [sp, #-16]!
bl	_helperFunction
str	d0, [x3]
sub	w4, w0, w1
str	w4, [x2]
ldp	x30, xzr, [sp], #16
ret
