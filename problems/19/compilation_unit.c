
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    if (int1 || (int1 * int2 > 100)) {
        *outInt = 1;
    } else {
        *outInt = 0;
    }
}
