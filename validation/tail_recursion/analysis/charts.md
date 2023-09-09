## Problem 03
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int2 == 1) {
        *outInt = int1;
        return;
    }
    customFunction(int1 + int1, int2 - 1, double1, double2, outInt, outDouble);
}

```
- Generated Assembly: [Clang O1](../problems/03/generated/clang_generated_O1_optimized.asm), [Clang O2](../problems/03/generated/clang_generated_O2_optimized.asm), [Clang O3](../problems/03/generated/clang_generated_O3_optimized.asm), **[Clang LLM optimized](../problems/03/generated/clang_generated_llm_optimized.asm)**, [Clang Unoptimized](../problems/03/generated/clang_generated_unoptimized.asm), **[LLM generated](../problems/03/generated/llm_generated.asm)**
### Results
![Chart for Problem 03](problem_03_chart.png)

