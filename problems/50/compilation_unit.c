
extern int pow(int, int);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int calc1 = pow(int1, int2);
    *outInt = calc1 * int2 + calc1 * int1;
}
