
int adjustValueBasedOnDoubles(int val, double a, double b) {
    return (a > b) ? val + (int)a : val - (int)b;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = adjustValueBasedOnDoubles(int1, double1, double2);
}
