
size_t stringLength(const char* str);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = stringLength(str1);
}

size_t stringLength(const char* str) {
    size_t len = 0;
    while (*str++) len++;
    return len;
}
