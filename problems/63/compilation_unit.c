
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int sum = 0;
    for(int i = 0; i < 5; i++) {
        sum += int1;
    }
    *outInt = sum;
    *outDouble = 0.0;
    *outString = NULL;
}
