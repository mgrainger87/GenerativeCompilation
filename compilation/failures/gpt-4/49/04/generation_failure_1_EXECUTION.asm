; compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program ran forever. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=0', 'int2=0', 'double1=0.0', 'double2=0.0', 'expectedInt=0', 'expectedDouble=0.0']
; Thread 16098972 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpc4ck9w9h`customFunction + 12
; 
; ; Correctness error: None
_helperFunction:
fadd d0, d0, d1  ; Add the two double values
ret              ; Return
.global _customFunction
_customFunction:
; Add the two integer values
add w4, w0, w1
str w4, [x2]

; Call helperFunction for the double addition
bl _helperFunction

; Store the result of helperFunction in *outDouble
str d0, [x3]

ret
