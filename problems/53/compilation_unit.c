
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    double a = double1 * int1;
    double b = a + double2;
    double c = a + int2;
    *outDouble = b + c;
}
