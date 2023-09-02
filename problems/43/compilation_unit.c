
extern size_t strlen(const char *);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    size_t len1 = strlen(str1);
    size_t len2 = strlen(str2);
    *outInt = len1 + len2 + (len1 > len2 ? len1 : len2);
}
