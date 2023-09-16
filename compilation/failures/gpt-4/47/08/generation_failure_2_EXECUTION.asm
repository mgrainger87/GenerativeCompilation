; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program ran forever. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=10', 'int2=0', 'double1=0.0', 'double2=5.5', 'expectedInt=10', 'expectedDouble=-5.5']
; Thread 16175035 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpwmxoapn4`customFunction + 12
; 
; ; Correctness error: None
.global _helperFunction
.global _customFunction

.text

.align 3
_helperFunction:
fneg d0, d0       ; Negate the value in d0 and store the result in d0
ret               ; Return from the function

.align 3
_customFunction:
str w0, [x2]      ; Store the value in w0 (int1) to the address pointed by x2 (outInt)
fmov d0, d1       ; Move the value in d1 (double2) to d0
bl _helperFunction; Call helperFunction
str d0, [x3]      ; Store the result from helperFunction in the address pointed by x3 (outDouble)
ret               ; Return from the function
