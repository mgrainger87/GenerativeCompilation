
int reverseOrderSum(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
    return a + b;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outInt = reverseOrderSum(int1, int2);
}
