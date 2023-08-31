
int complexFunction(int x, int y) {
    return x * y + x - y + 5;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = complexFunction(int1, 0) + complexFunction(0, int2);
    *outDouble = double1 * 1.5 - double2 * 0.5;
}
