
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int tempA = int1 + 5;
    int tempB = int2 - 3;
    int tempC = tempA * tempB;
    *outInt = tempC + tempB;
    *outDouble = 0.0;
    *outString = NULL;
}
