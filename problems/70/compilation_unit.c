
extern int strlen(const char *s);

static int addition(int a, int b) {
    return a + b;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int tempA = addition(int1, 5);
    int tempB = addition(int2, 3);
    int tempC = addition(tempA, tempB);
    *outInt = tempC;
    *outDouble = 0.0;
    *outString = NULL;
}
