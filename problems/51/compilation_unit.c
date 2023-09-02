
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int a = int1 * int2;
    int b = a + int1;
    int c = a + int2;
    *outInt = b + c;
}
