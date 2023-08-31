
int multiplier(int x, int y) {
    return x * y;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = multiplier(int1, 0) + multiplier(int2, 1) + 7;
    *outDouble = double1 * 1.0 + double2 * 0.0 + 3.0;
}
