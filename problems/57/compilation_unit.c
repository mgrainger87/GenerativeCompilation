
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int temp1 = int1;
    int temp2 = int2;
    *outInt = temp1 + temp2;
    *outDouble = 0.0;
    *outString = NULL;
}
