; compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program ran forever. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=1000', 'int2=0', 'double1=1000.0', 'double2=0.0', 'expectedInt=1000', 'expectedDouble=1000000.0']
; Thread 15410796 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpd0og_kll`customFunction + 8
; 
; ; Correctness error: None
; .text
.global _helperFunction
_helperFunction:
fmul d0, d0, d0
ret

.global _customFunction
_customFunction:
str w0, [x2]
bl _helperFunction
str d0, [x3]
ret
