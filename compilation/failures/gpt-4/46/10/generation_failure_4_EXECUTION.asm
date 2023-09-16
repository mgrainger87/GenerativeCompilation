; compiler_errors=1,linker_errors=0,execution_errors=3,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program ran forever. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=10', 'int2=5', 'double1=0', 'double2=0.5', 'expectedInt=50', 'expectedDouble=0.5']
; Thread 15921441 Backtrace:
; frame #0: [33m0x0000000100003960[0m tmp_5ywvqoy`customFunction + 8
; frame #1: [33m0x000000010000395c[0m tmp_5ywvqoy`customFunction + 4
; frame #2: [33m0x00000001ac0c7f28[0m dyld`start + 2236
; 
; ; Correctness error: None
.global _helperFunction
.align 3

_helperFunction:
// Multiply a and b
mul w0, w0, w1
// Return the result
ret

.global _customFunction
.align 3

_customFunction:
// Call helperFunction to multiply int1 and int2
bl _helperFunction

// Store the result to the location pointed by outInt
str w0, [x2]

// Store double2 to the location pointed by outDouble
str d1, [x3]

// Return to the caller
ret
