Optimize the provided arm64 assembly that corresponds to the provided C compilation unit.

Compilation unit:

```
void customFunction(int int1, int int2,
double double1, double double2,
int *outInt, double *outDouble) {
*outInt = int1;
*outDouble = double1;
}

```
Assembly:
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #48
.cfi_def_cfa_offset 48
str	w0, [sp, #44]
str	w1, [sp, #40]
str	d0, [sp, #32]
str	d1, [sp, #24]
str	x2, [sp, #16]
str	x3, [sp, #8]
ldr	w8, [sp, #44]
ldr	x9, [sp, #16]
str	w8, [x9]
ldr	d0, [sp, #32]
ldr	x8, [sp, #8]
str	d0, [x8]
add	sp, sp, #48
ret
.cfi_endproc
; -- End function
.subsections_via_symbols


Guidelines:


- Follow the arm64 calling convention strictly. Write out which registers are used for which parameters before generating the assembly.
- Preserve the values of caller-saved and/or callee-saved registers where necessary.
- Mangle function names according to Clang conventions for C (not C++). Mark symbols as global where necessary. Align symbols appropriately for arm64.
- Follow arm64 convention for local labels starting with a numeric value, which makes them assembler-local.
- Before branching for a function call, be sure to save all required registers.
- Use only valid arm64 instructions. ARM64 assembly does not allow direct floating-point literals with the fadd instruction.
- Use appropriate register widths for an LP64 architecture, where integers are 32 bits.
