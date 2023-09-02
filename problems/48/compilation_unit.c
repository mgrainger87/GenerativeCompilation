
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    double result = (int1 * double1 + int2) * (int1 * double1 + int2);
    *outDouble = result;
}
