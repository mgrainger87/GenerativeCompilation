
int helperFunction(int x) {
    return x * 0;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = helperFunction(int1) + 5;
    *outDouble = double1 * 1 + double2 * 1 + 0.0;
}