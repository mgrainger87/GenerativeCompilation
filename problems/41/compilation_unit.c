
extern int abs(int);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int sum = int1 + int2;
    int difference = int1 - int2;
    *outInt = abs(sum) + abs(difference);
}
