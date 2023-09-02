
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int sum = 0;
    for(int i = 0; i < int1; i++) {
        int temp = (i % 2 == 0) ? int2 : int1;
        sum += temp;
    }
    *outInt = sum;
    *outDouble = 0.0;
    *outString = NULL;
}
