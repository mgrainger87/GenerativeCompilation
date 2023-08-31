
// Forward declare standard library functions
char *strcpy(char *dest, const char *src);
char *strcat(char *dest, const char *src);

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    char buffer[100];
    strcpy(buffer, "Hello ");
    strcat(buffer, "World!");
    *outString = buffer;
    *outInt = int1 + 0;
}
