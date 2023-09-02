
size_t strlen(const char *);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    strlen(str1);
    *outInt = int1 & int2;
}
