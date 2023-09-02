
extern int strlen(const char *s);
extern char *strcat(char *dest, const char *src);
static char buffer[256];

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    buffer[0] = '\0';
    strcat(buffer, str1);
    strcat(buffer, str2);
    *outInt = 0;
    *outDouble = 0.0;
    *outString = buffer;
}
