
int anotherComplexFunction(int x) {
    return x * 2 - 3 + 1 - x;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = anotherComplexFunction(int1) + int2 * 5 - 5;
    *outDouble = double1 * 2.0 + double2 * 3.0 - 5.0;
}
