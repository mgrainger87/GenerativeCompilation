; compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program ran forever. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=0', 'int2=0', 'double1=0', 'double2=0', 'expectedInt=0', 'expectedDouble=0']
; Thread 15932834 Backtrace:
; frame #0: [33m0x000000010000395c[0m tmplbqaer4_`customFunction + 4
; 
; ; Correctness error: None
.global _helperFunction
_helperFunction:
add w0, w0, w1
ret

.global _customFunction
_customFunction:
// Call helperFunction to add int1 and int2
bl _helperFunction
// Store the result at the location pointed by outInt
str w0, [x2]

// Add double1 and double2
fadd d0, d0, d1
// Store the result at the location pointed by outDouble
str d0, [x3]

ret
