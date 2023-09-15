; compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program ran forever. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=10', 'int2=0', 'double1=0.0', 'double2=5.5', 'expectedInt=10', 'expectedDouble=-5.5']
; Thread 16178927 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpkaq1k6lz`customFunction + 8
; 
; ; Correctness error: None
; .global _helperFunction
.global _customFunction

.align 2
_helperFunction:
fneg    d0, d0
ret

.align 2
_customFunction:
// Store int1 to *outInt
str     w0, [x2]

// Call helperFunction with double2
bl      _helperFunction

// Store result of helperFunction to *outDouble
str     d0, [x3]

ret
