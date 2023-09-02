
extern double sqrt(double);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    double product = double1 * double2;
    double quotient = double1 / double2;
    *outDouble = sqrt(product) + sqrt(quotient);
}
