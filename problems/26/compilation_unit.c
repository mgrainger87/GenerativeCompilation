
double multiply(double a, double b) {
    return a * b;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outDouble = multiply(double1, double2);
}
