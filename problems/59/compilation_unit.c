
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    double tempResult = double1 * double2;
    *outInt = (int)tempResult;
    *outDouble = tempResult;
    *outString = NULL;
}
