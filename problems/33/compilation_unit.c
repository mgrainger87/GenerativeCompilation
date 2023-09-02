
int conditionalSubtraction(int a, const char* str) {
    int len = 0;
    while (*str++) len++;
    return (len % 2 == 0) ? a - len : a;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = conditionalSubtraction(int1, str1);
}
