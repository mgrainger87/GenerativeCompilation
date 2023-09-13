//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.p2align 2
_customFunction:
.cfi_startproc
str x0, [x2]        // Store int1 into outInt
str d0, [x3]        // Store double1 into outDouble
ret
.cfi_endproc
