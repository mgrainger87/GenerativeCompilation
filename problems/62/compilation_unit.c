
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int temp = (int1 > int2) ? int1 : int2;
    *outInt = temp + 5;
    *outDouble = 0.0;
    *outString = NULL;
}
