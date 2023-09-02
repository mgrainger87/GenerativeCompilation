
// Forward declare standard library function
int strlen(const char *str);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = strlen("constant");
    *outDouble = double1 * 0 + double2 * 0;
}
