
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    double tempA = double1 * 3.14;
    int tempB = int1 + (int)tempA;
    double tempC = double2 + tempB;
    *outInt = tempB;
    *outDouble = tempC;
    *outString = NULL;
}
