
int combineBasedOnString(int a, int b, const char* str) {
    int len = 0;
    while (*str++) len++;
    return (len < 5) ? a + b : a - b;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = combineBasedOnString(int1, int2, str1);
}
