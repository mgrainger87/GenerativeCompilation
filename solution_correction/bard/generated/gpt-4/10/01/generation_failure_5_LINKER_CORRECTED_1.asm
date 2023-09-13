//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.p2align 2
_customFunction:
str w0, [x2]     ; Store int1 into outInt
str d0, [x3]     ; Store double1 into outDouble
ret
