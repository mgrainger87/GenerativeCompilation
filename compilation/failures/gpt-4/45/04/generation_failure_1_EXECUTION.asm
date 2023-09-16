; compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program ran forever. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=1', 'int2=2', 'double1=3.0', 'double2=4.0', 'expectedInt=2', 'expectedDouble=0.75']
; Thread 15192075 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpy6z53ev1`customFunction + 8
; 
; ; Correctness error: None
.global _helperFunction
_helperFunction:
fdiv    d0, d0, d1      ; d0 = a / b
ret
.global _customFunction
_customFunction:
; Store int2 to *outInt
str     w1, [x2]         ; *outInt = int2

; Call helperFunction
; Since helperFunction only uses d0 and d1 (which are already set up for customFunction),
; and doesn't change any callee-saved registers, we don't need to save and restore any registers.
bl      _helperFunction  ; d0 = helperFunction(double1, double2)

; Store the return value of helperFunction to *outDouble
str     d0, [x3]         ; *outDouble = d0

ret
