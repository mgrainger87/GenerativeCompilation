//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp  lr, fp, [sp, #-16]!  ; Save lr and fp to the stack
mov  fp, sp               ; Set up frame pointer

str  d0, [x3]             ; *outDouble = double1;

mov  w4, wzr              ; w4 = i = 0
loop_start:
cmp  w4, w0               ; Compare i with int1
b.ge loop_end             ; If i >= int1, exit loop
fdiv d0, d0, d1           ; *outDouble = *outDouble / double2;
add  w4, w4, #1           ; i++
b    loop_start           ; Repeat the loop
loop_end:

str  wzr, [x2]            ; *outInt = 0;

ldp  lr, fp, [sp], #16    ; Restore lr and fp from the stack
ret                       ; Return to caller
