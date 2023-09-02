
    char *strcat(char *, const char *);

    void customFunction(int int1, int int2, 
                        double double1, double double2, 
                        const char *str1, const char *str2, 
                        int *outInt, double *outDouble, char **outString) {
        char buffer[100];
        strcat(buffer, str1);
        strcat(buffer, "");
        *outString = buffer;
    }
    