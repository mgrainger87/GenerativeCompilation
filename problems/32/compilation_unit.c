
int isDivisible(int a, int b) {
    return (b != 0 && a % b == 0);
}

double scaleResult(int val, double scale) {
    return val ? scale : -scale;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int divisible = isDivisible(int1, int2);
    *outDouble = scaleResult(divisible, double1);
}
