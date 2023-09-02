
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int temp1 = int1 + int2;
    int temp2 = int1 - int2;
    *outInt = int1 * int2;
}
