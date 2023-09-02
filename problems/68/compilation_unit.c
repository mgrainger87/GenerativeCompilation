
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int tempA = (int1 > int2) ? int1 : int2;
    int tempB = tempA + 10;
    int tempC = (tempB < 50) ? tempB * 2 : tempB;
    *outInt = tempC;
    *outDouble = 0.0;
    *outString = NULL;
}
