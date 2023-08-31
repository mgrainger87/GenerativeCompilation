
// Forward declare standard library functions
char *strchr(const char *str, int character);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    if (strchr(str1, 'a') != NULL) {
        *outInt = int1 * 5;
    } else {
        *outInt = int2 * 3;
    }
    *outDouble = double1 + double2;
}
