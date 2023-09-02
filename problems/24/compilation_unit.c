
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    if (int1 > 50) {
        *outInt = int1 * int2;
        if (int2 > 50) {
            *outInt = int1 + int2;
        }
    }
}
