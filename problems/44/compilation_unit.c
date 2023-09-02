
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int calc1 = int1 * int2 + int2 * int1;
    double calc2 = double1 * double2 + double2 * double1;
    *outDouble = calc1 + calc2;
}
