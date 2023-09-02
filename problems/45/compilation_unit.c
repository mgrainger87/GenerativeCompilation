
extern int strcmp(const char *, const char *);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int comparison = strcmp(str1, str2);
    double result = int1 * double1 + comparison;
    *outDouble = result + double1 * int1;
}
