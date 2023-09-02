
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int length1 = strlen(str1);
    int length2 = strlen(str2);
    *outInt = length1 + length2;
    *outDouble = 0.0;
    *outString = NULL;
}
