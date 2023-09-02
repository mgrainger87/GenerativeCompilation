
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    for (int i = 0; i < int1; i++) {
        *outInt = int2 * 2;
    }
}
