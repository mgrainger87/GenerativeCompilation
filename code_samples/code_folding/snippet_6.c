
// Forward declare standard library functions
int strcmp(const char *str1, const char *str2);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    if (strcmp(str1, "optimize") == 0) {
        *outInt = int1 * 4 + 12;
    } else {
        *outInt = int2 * 5;
    }
    *outDouble = double1 * 0.5 + double2 * 2.5;
}
