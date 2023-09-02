
int startsWith(const char* str, const char* prefix) {
    while (*prefix) {
        if (*str++ != *prefix++)
            return 0;
    }
    return 1;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = startsWith(str1, str2);
}
