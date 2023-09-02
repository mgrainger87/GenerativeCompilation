
extern int strcmp(const char *, const char *);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int comparison = strcmp(str1, str2);
    *outInt = (comparison == 0) || (comparison > 0);
}
