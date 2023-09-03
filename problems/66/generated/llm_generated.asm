.globl _customFunction
.p2align 2
_customFunction:
  stp x19, x20, [sp, #-16]!  ; Preserve x19 and x20 onto the stack
  mov x19, #0                ; Initialize loop counter i in x19 (x19 = i = 0)
1:                           ; Start of loop
  cmp x19, #4                ; Check if loop counter is < 4 (x19 < 4)
  b.ge 2f                    ; Exit loop if x19 >= 4
  fsub d2, d0, d1            ; d2 = d0 - d1 (use d2 as a temporary register)
  str d2, [x3]               ; Store the result to memory
  add x19, x19, #1           ; Increment loop counter (i++)
  b 1b                       ; Repeat loop
2:                           ; End of loop
  ldp x19, x20, [sp], #16    ; Restore x19 and x20 from the stack
  ret                        ; Return from function
