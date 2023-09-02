
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
					double double1, double double2, 
					const char *str1, const char *str2, 
					int *outInt, double *outDouble, char **outString)
{
    *outInt = int1 * int1;
    *outDouble = 0.0; // unused
    *outString = (char *)str2; // just a simple pointer assignment
}
    