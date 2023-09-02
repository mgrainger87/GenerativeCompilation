
double complexOperation(int a, int b) {
    return a * 0.5 + b * 0.3;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outDouble = complexOperation(int1, int2);
}
