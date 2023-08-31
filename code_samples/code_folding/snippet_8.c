
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int temp = int1 * 3 - int2 * 2;
    *outInt = temp + 7 - 2;
    *outDouble = double1 * 0 + double2;
}
