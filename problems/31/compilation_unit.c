
double complexCalculation(int a, double b) {
    return (a * b + a - b) / 3.0;
}

int intermediateOperation(int x, double y) {
    return x + (int)complexCalculation(x, y);
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = intermediateOperation(int1, double1);
}
