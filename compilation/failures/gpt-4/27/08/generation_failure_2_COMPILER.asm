; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: clang: error: unable to execute command: Segmentation fault: 11
; clang: error: clang integrated assembler command failed due to signal (use -v to see invocation)
; Apple clang version 14.0.3 (clang-1403.0.22.14.1)
; Target: arm64-apple-darwin22.6.0
; Thread model: posix
; InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
; clang: note: diagnostic msg: 
; ********************
; 
; PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
; Preprocessed source(s) and associated run script(s) are located at:
; clang: note: diagnostic msg: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpprzsgxtf-e2149c.S
; clang: note: diagnostic msg: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpprzsgxtf-e2149c.sh
; clang: note: diagnostic msg: Crash backtrace is located in
; clang: note: diagnostic msg: /Users/morgang/Library/Logs/DiagnosticReports/clang_<YYYY-MM-DD-HHMMSS>_<hostname>.crash
; clang: note: diagnostic msg: (choose the .crash file that corresponds to your crash)
; clang: note: diagnostic msg: 
; 
; ********************
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; _customFunction:
stp x29, x30, [sp, #-16]!
mov x29, sp
adrp x4, :got:1.0
ldr d2, [x4, #:got_lo12:1.0]
str d2, [x3]
mov w5, wzr
1:  cbz w0, 3f
fmul d2, d0, d1
ldr d3, [x3]
fmul d2, d2, d3
str d2, [x3]
add w5, w5, #1
sub w0, w0, #1
b 1b
3:  mov w6, wzr
str w6, [x2]
ldp x29, x30, [sp], #16
ret
