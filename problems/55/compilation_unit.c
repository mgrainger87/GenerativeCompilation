
extern int pow(int, int);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int a = pow(int1, int2);
    int b = a + int1;
    int c = b + a;
    *outInt = c + b;
}
