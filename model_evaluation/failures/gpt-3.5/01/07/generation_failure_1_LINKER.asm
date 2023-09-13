; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: _customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7m0hs216.o
; Undefined symbols for architecture arm64:
;   "_outDouble", referenced from:
;       _customFunction in tmp7m0hs216.o
;   "_outInt", referenced from:
;       _customFunction in tmp7m0hs216.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction

.text

_customFunction:
// Prologue
// Save callee-saved registers
STP X19, X20, [SP, -16]!
STP X21, X22, [SP, -16]!
STP X23, X24, [SP, -16]!
STP X25, X26, [SP, -16]!
STP X27, X28, [SP, -16]!
// Save the frame pointer
STP X29, X30, [SP, -16]!
// Set up the frame pointer
ADD X29, SP, 16

// Store incoming integer parameters in local variables
STR W0, [X29, #16]
STR W1, [X29, #20]

// Store incoming double parameters in local variables
STR D0, [X29, #24]
STR D1, [X29, #32]

// Load the address of outInt into X8
ADRP X8, _outInt@page
LDR X8, [X8, _outInt@pageoff]

// Store int1 (local variable) to *outInt
LDR W0, [X29, #16]
STR W0, [X8]

// Load the address of outDouble into X8
ADRP X8, _outDouble@page
LDR X8, [X8, _outDouble@pageoff]

// Store double1 (local variable) to *outDouble
LDR D0, [X29, #24]
STR D0, [X8]

// Epilogue
// Restore callee-saved registers
LDP X19, X20, [SP], 16
LDP X21, X22, [SP], 16
LDP X23, X24, [SP], 16
LDP X25, X26, [SP], 16
LDP X27, X28, [SP], 16
// Restore the frame pointer and return
LDP X29, X30, [SP], 16
RET
