
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = int1 * 2 + int2 * 3 + 10;
    *outDouble = double1 + double2 + 5.5;
}
