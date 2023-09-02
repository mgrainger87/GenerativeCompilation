
extern int strlen(const char *s);

static int product(int a, int b) {
    return a * b;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int temp = product(int1, int2);
    *outInt = temp;
    *outDouble = 0.0;
    *outString = NULL;
}
