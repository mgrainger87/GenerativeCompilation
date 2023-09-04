## Problem 01
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = int1 * 1 + 0;
    *outDouble = double1 * 1.0 + 0.0;
}
    
```
### Results
![Chart for Problem 01](problem_01_chart.png)

## Problem 02
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = int1 / 1;
    *outDouble = double1 / 1.0;
}
    
```
### Results
![Chart for Problem 02](problem_02_chart.png)

## Problem 03
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = int1 * 0;
    *outDouble = double1 * 0.0;
}
    
```
### Results
![Chart for Problem 03](problem_03_chart.png)

## Problem 04
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = (int1 + int2 * 0) * 2;
    *outDouble = (double1 - double2 * 0.0) * 2.0;
}
    
```
### Results
![Chart for Problem 04](problem_04_chart.png)

## Problem 05
### Compilation Unit
```c

static int power(int base, int exp) {
    int result = 1;
    for(int i = 0; i < exp; i++) {
        result *= base;
    }
    return result;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = power(int1, 1);
    *outDouble = power(double1, 0);
}
    
```
### Results
![Chart for Problem 05](problem_05_chart.png)

## Problem 06
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int product = int1 * int2;
    *outInt = product + product;
    *outDouble = double1 + double2;
}
    
```
### Results
![Chart for Problem 06](problem_06_chart.png)

## Problem 07
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = (int1 * int2) + 0;
    *outDouble = double1 * double2;
}
    
```
### Results
![Chart for Problem 07](problem_07_chart.png)

## Problem 08
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = (int1 * 2) / 2;
    *outDouble = double1 * double2;
}
    
```
### Results
![Chart for Problem 08](problem_08_chart.png)

## Problem 09
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int sum1 = int1 + int2;
    int sum2 = int1 + int2;
    *outInt = sum1 - sum2;
    *outDouble = double1 * double2;
}
    
```
### Results
![Chart for Problem 09](problem_09_chart.png)

## Problem 10
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = ((int1 + int2) * 0) + int2;
    *outDouble = (double1 + double2) * (double1 - double2);
}
    
```
### Results
![Chart for Problem 10](problem_10_chart.png)

## Problem 100
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int2 * 10;
    int b = a;
    *outInt = b;
    double x = double2 * 2.0;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 100](problem_100_chart.png)

## Problem 11
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = (int1 + 10 - 5) * (int2 + 5 - 2);
}

```
### Results
![Chart for Problem 11](problem_11_chart.png)

## Problem 12
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    double temp = double1 + 1.1;
    *outDouble = temp + double2 - 0.1;
}

```
### Results
![Chart for Problem 12](problem_12_chart.png)

## Problem 13
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int part1 = int1 * int2 + int1 - int2;
    int part2 = int1 * int2 - int1 + int2;
    *outInt = part1 + part2 - int1 * int2;
    *outDouble = double1 + double2;
}
    
```
### Results
![Chart for Problem 13](problem_13_chart.png)

## Problem 14
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int temp1 = int1 + 7;
    double temp2 = double2 - 0.5;
    *outDouble = temp1 + temp2;
}

```
### Results
![Chart for Problem 14](problem_14_chart.png)

## Problem 15
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int base = int1 * 2 + int2 / 2;
    if (base > 10) {
        *outInt = base + int1 - int2;
    } else {
        *outInt = base - int1 + int2;
    }
    *outDouble = double1 + double2;
}
    
```
### Results
![Chart for Problem 15](problem_15_chart.png)

## Problem 16
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outDouble = (double1 + 2.5 - 1.5) / (double2 + 1.0 - 0.5);
}

```
### Results
![Chart for Problem 16](problem_16_chart.png)

## Problem 17
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int temp = int1 + 4 - 2;
    *outDouble = double2 + temp - 1.0;
}

```
### Results
![Chart for Problem 17](problem_17_chart.png)

## Problem 18
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outDouble = double1 * (2.0 + 1.5 - 1.0) + double2;
}

```
### Results
![Chart for Problem 18](problem_18_chart.png)

## Problem 19
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = int1 - (5 + 3 - 2) + int2;
}

```
### Results
![Chart for Problem 19](problem_19_chart.png)

## Problem 20
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int temp1 = int1 + 6 - 3;
    double temp2 = double2 + 1.5 - 0.5;
    *outDouble = temp1 + temp2;
}

```
### Results
![Chart for Problem 20](problem_20_chart.png)

## Problem 21
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int a = int1;
    a += int2;
    *outInt = int2;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 21](problem_21_chart.png)

## Problem 22
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int unusedVar = 5;
    *outInt = int1 + int2;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 22](problem_22_chart.png)

## Problem 23
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    for (int i = 0; i < int1; i++) {
        int tmp = int1 * int2;
    }
    *outInt = int2;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 23](problem_23_chart.png)

## Problem 24
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    if (int1 > 10) {
        if (int2 < 5) {
            int tmp = int1 - int2;
        }
    } else {
        *outInt = int1 + int2;
    }
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 24](problem_24_chart.png)

## Problem 25
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int var1 = int1 * 2;
    int var2 = int2 * 3;
    double var3 = double1 / 2;
    
    *outInt = int1 + int2;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 25](problem_25_chart.png)

## Problem 26
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int tmp = int1 + int2;
    tmp = int1 - int2;
    *outInt = tmp;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 26](problem_26_chart.png)

## Problem 27
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if (int1 > 5) {
        *outInt = int1;
        return;
    }
    *outInt = int1 + int2;
    *outDouble = double1 - double2;
}

```
### Results
![Chart for Problem 27](problem_27_chart.png)

## Problem 28
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    *outInt = int1;
    *outInt = int2;
    *outDouble = double1;
    *outDouble = double2;
}

```
### Results
![Chart for Problem 28](problem_28_chart.png)

## Problem 29
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if (int1 && !int1) {
        *outInt = int1 - int2; // This will never be executed
    }
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 29](problem_29_chart.png)

## Problem 30
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    if (int1 > int2) {
        *outInt = int1 + int2;
    } else {
        *outInt = int1 + int2;
    }
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 30](problem_30_chart.png)

## Problem 31
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int tmp1 = int1 * 2;
    int tmp2 = int2 - 5;
    int tmp3 = int1 + int2;
    *outInt = tmp3;
    double tmpDouble1 = double1 / 2;
    double tmpDouble2 = double2 * 3;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 31](problem_31_chart.png)

## Problem 32
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    for (int i = 0; i < int1; i++) {
        *outInt = int1 * int2;
    }
    *outInt = int1 + int2;
    for (int j = 0; j < int2; j++) {
        double tmp = double1 * 2;
    }
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 32](problem_32_chart.png)

## Problem 33
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = int1;
    *outInt = int2;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 33](problem_33_chart.png)

## Problem 34
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = int1 * 1; 
    *outDouble = double1 + double2 + 0;
}

```
### Results
![Chart for Problem 34](problem_34_chart.png)

## Problem 35
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    *outInt = int1;
    for (int i = 0; i < int1; i++) {
        if (i % 2 == 0) {
            *outInt = int1 + int2;
        }
    }
    *outInt = int1 - int2;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 35](problem_35_chart.png)

## Problem 36
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = int1 + 0;
    *outDouble = double1 * 1.0;
}

```
### Results
![Chart for Problem 36](problem_36_chart.png)

## Problem 37
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int temp = int1;
    temp = int2;
    *outInt = temp;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 37](problem_37_chart.png)

## Problem 38
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    *outInt = int1 * int2;
    *outInt = int1 + int2;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 38](problem_38_chart.png)

## Problem 39
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if (int1 > int2 && int1 < int2) {
        *outInt = int1 - int2;
    }
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 39](problem_39_chart.png)

## Problem 40
### Compilation Unit
```c

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int temp = int1;
    temp = int2;
    temp = int1 + int2;
    *outInt = temp;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 40](problem_40_chart.png)

## Problem 41
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 * 8;
    *outDouble = double2 * 16.0;
}

```
### Results
![Chart for Problem 41](problem_41_chart.png)

## Problem 42
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int2 / 4;
    *outDouble = double1 / 2.0;
}

```
### Results
![Chart for Problem 42](problem_42_chart.png)

## Problem 43
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 + int1 + int1;
    *outDouble = double1 + double1 + double1 + double1;
}

```
### Results
![Chart for Problem 43](problem_43_chart.png)

## Problem 44
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 * int1;
    *outDouble = double2 * double2;
}

```
### Results
![Chart for Problem 44](problem_44_chart.png)

## Problem 45
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 + int1 + int1 + int1 + int1;
    *outDouble = double1 + double1 + double1 + double1 + double1 + double1;
}

```
### Results
![Chart for Problem 45](problem_45_chart.png)

## Problem 46
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 * int2 + int1;
    *outDouble = double1 * double2 + double1;
}

```
### Results
![Chart for Problem 46](problem_46_chart.png)

## Problem 47
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 * (int2 + 3);
    *outDouble = double1 * (double2 + 1.5);
}

```
### Results
![Chart for Problem 47](problem_47_chart.png)

## Problem 48
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 * int1 * int1 * int1;
    *outDouble = double1 * double1 * double1 * double1;
}

```
### Results
![Chart for Problem 48](problem_48_chart.png)

## Problem 49
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 + int1;
    *outDouble = double1 + double1;
}

```
### Results
![Chart for Problem 49](problem_49_chart.png)

## Problem 50
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 * (1/3);
    *outDouble = double1 * 0.25;
}

```
### Results
![Chart for Problem 50](problem_50_chart.png)

## Problem 51
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1 * (4 + 4);
    *outDouble = double2 * (8 + 8);
}

```
### Results
![Chart for Problem 51](problem_51_chart.png)

## Problem 52
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int2 * 8) - int2;
    *outDouble = (double1 * 4) - double1;
}

```
### Results
![Chart for Problem 52](problem_52_chart.png)

## Problem 53
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 * 7) + int1;
    *outDouble = (double1 * 15) + double1;
}

```
### Results
![Chart for Problem 53](problem_53_chart.png)

## Problem 54
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 * 3) + (int1 * 2) + int1;
    *outDouble = (double1 * 4) + (double1 * 3) + double1;
}

```
### Results
![Chart for Problem 54](problem_54_chart.png)

## Problem 55
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 * 4) + int1 + int1;
    *outDouble = (double1 * 5) + double1 + double1 + double1;
}

```
### Results
![Chart for Problem 55](problem_55_chart.png)

## Problem 56
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 + 2) * (int2 + 3);
    *outDouble = (double1 + 1.0) * (double2 + 2.0);
}

```
### Results
![Chart for Problem 56](problem_56_chart.png)

## Problem 57
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 * 6) - (int1 * 2);
    *outDouble = (double1 * 7) - (double1 * 3);
}

```
### Results
![Chart for Problem 57](problem_57_chart.png)

## Problem 58
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 * 5) + (int1 * 2);
    *outDouble = (double1 * 6) + (double1 * 1);
}

```
### Results
![Chart for Problem 58](problem_58_chart.png)

## Problem 59
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 * 3) + (int1 * 4);
    *outDouble = (double1 * 2) + (double1 * 5);
}

```
### Results
![Chart for Problem 59](problem_59_chart.png)

## Problem 60
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 * 6) * 0.5;
    *outDouble = (double1 * 8) * 0.25;
}

```
### Results
![Chart for Problem 60](problem_60_chart.png)

## Problem 61
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int sum = 0;
    for (int i = 0; i < 4; i++) {
        sum += int1;
    }
    *outInt = sum;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 61](problem_61_chart.png)

## Problem 62
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    double result = 0;
    for (int i = 0; i < 4; i++) {
        result += double1;
    }
    *outInt = int1 + int2;
    *outDouble = result;
}

```
### Results
![Chart for Problem 62](problem_62_chart.png)

## Problem 63
### Compilation Unit
```c

static double helper(double val) {
    return val * 2;
}

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    double result = 0;
    for (int i = 0; i < 3; i++) {
        result += helper(double2);
    }
    *outInt = int1;
    *outDouble = result;
}

```
### Results
![Chart for Problem 63](problem_63_chart.png)

## Problem 64
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int sum = 0;
    for (int i = 0; i < 2; i++) {
        sum += int2;
    }
    *outInt = sum + int1;
    *outDouble = double1;
}

```
### Results
![Chart for Problem 64](problem_64_chart.png)

## Problem 65
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    double result = 0;
    for (int i = 0; i < 5; i++) {
        result += double1;
    }
    *outInt = int2;
    *outDouble = result;
}

```
### Results
![Chart for Problem 65](problem_65_chart.png)

## Problem 66
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 4; i++) {
        *outDouble = double1 - double2;
    }
}
    
```
### Results
![Chart for Problem 66](problem_66_chart.png)

## Problem 67
### Compilation Unit
```c

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int result = 0;
    for (int i = 0; i < (int1 & 3); i++) {
        result += int2;
    }
    *outInt = result;
    *outDouble = double1 + double2;
}

```
### Results
![Chart for Problem 67](problem_67_chart.png)

## Problem 68
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 4; i++) {
        *outInt = int1 * int1;
    }
}
    
```
### Results
![Chart for Problem 68](problem_68_chart.png)

## Problem 69
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 4; i++) {
        *outInt = int1 + int2;
    }
}
    
```
### Results
![Chart for Problem 69](problem_69_chart.png)

## Problem 70
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 4; i++) {
        *outDouble = (int1 + int2 + double1 + double2) / 4.0;
    }
}
    
```
### Results
![Chart for Problem 70](problem_70_chart.png)

## Problem 71
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outInt = int1;
    }
}
    
```
### Results
![Chart for Problem 71](problem_71_chart.png)

## Problem 72
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outInt = int2;
    }
}
    
```
### Results
![Chart for Problem 72](problem_72_chart.png)

## Problem 73
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outDouble = double1;
    }
}
    
```
### Results
![Chart for Problem 73](problem_73_chart.png)

## Problem 74
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outDouble = double2;
    }
}
    
```
### Results
![Chart for Problem 74](problem_74_chart.png)

## Problem 75
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outInt = int1 + int2;
    }
}
    
```
### Results
![Chart for Problem 75](problem_75_chart.png)

## Problem 76
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outDouble = double1 + double2;
    }
}
    
```
### Results
![Chart for Problem 76](problem_76_chart.png)

## Problem 77
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outInt = int1 - int2;
    }
}
    
```
### Results
![Chart for Problem 77](problem_77_chart.png)

## Problem 78
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outDouble = double1 - double2;
    }
}
    
```
### Results
![Chart for Problem 78](problem_78_chart.png)

## Problem 79
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outInt = int1 * 2;
    }
}
    
```
### Results
![Chart for Problem 79](problem_79_chart.png)

## Problem 80
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 2; i++) {
        *outDouble = double1 * 2.0;
    }
}
    
```
### Results
![Chart for Problem 80](problem_80_chart.png)

## Problem 81
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1;
    int b = a;
    *outInt = b;
    double x = double1;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 81](problem_81_chart.png)

## Problem 82
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 + int2;
    int b = a;
    *outInt = b + int2;
    double x = double1 - double2;
    double y = x;
    *outDouble = y + double1;
}

```
### Results
![Chart for Problem 82](problem_82_chart.png)

## Problem 83
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 * 2;
    int b = a;
    *outInt = b;
    double x = double1 * 0.5;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 83](problem_83_chart.png)

## Problem 84
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int1;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double2;
    double x = tempD;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 84](problem_84_chart.png)

## Problem 85
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 - int2;
    int b = a;
    *outInt = b;
    double x = double2 + double1;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 85](problem_85_chart.png)

## Problem 86
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int2;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double1;
    double x = tempD;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 86](problem_86_chart.png)

## Problem 87
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 * 3;
    int b = a;
    *outInt = b;
    double x = double2 * 0.25;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 87](problem_87_chart.png)

## Problem 88
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int1 + int2;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double1 - double2;
    double x = tempD;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 88](problem_88_chart.png)

## Problem 89
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int2 * 4;
    int b = a;
    *outInt = b;
    double x = double2 * 0.75;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 89](problem_89_chart.png)

## Problem 90
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int1 - int2;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double2 + double1;
    double x = tempD;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 90](problem_90_chart.png)

## Problem 91
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 + 5;
    int b = a;
    *outInt = b;
    double x = double1 * 1.1;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 91](problem_91_chart.png)

## Problem 92
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int2 - 3;
    int b = a;
    *outInt = b;
    double x = double2 * 1.2;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 92](problem_92_chart.png)

## Problem 93
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int1 + 10;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double1 * 1.3;
    double x = tempD;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 93](problem_93_chart.png)

## Problem 94
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int2 - 8;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double2 * 1.4;
    double x = tempD;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 94](problem_94_chart.png)

## Problem 95
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 * 6;
    int b = a;
    *outInt = b;
    double x = double1 * 1.5;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 95](problem_95_chart.png)

## Problem 96
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int2 * 7;
    int b = a;
    *outInt = b;
    double x = double2 * 1.6;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 96](problem_96_chart.png)

## Problem 97
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int1 + 12;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double1 * 1.7;
    double x = tempD;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 97](problem_97_chart.png)

## Problem 98
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int2 - 15;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double2 * 1.8;
    double x = tempD;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 98](problem_98_chart.png)

## Problem 99
### Compilation Unit
```c

void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 * 9;
    int b = a;
    *outInt = b;
    double x = double1 * 1.9;
    double y = x;
    *outDouble = y;
}

```
### Results
![Chart for Problem 99](problem_99_chart.png)

