
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    int tempResultInt = int1 + (int)double1;
    double tempResultDouble = double1 + (double)int1;
    *outInt = tempResultInt;
    *outDouble = tempResultDouble;
    *outString = NULL;
}
