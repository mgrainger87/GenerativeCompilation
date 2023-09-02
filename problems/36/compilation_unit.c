
int max(int a, int b) {
    if (a > b) return a;
    else return b;
}

int doubleValue(int x) {
    return 2 * x;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int maxValue = max(int1, int2);
    *outInt = doubleValue(maxValue);
}
