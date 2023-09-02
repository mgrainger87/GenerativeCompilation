
extern int strlen(const char *);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    size_t length1 = strlen(str1);
    int a = int1 + length1;
    size_t length2 = strlen(str1);
    int b = int2 + length2;
    *outInt = a + b;
}
