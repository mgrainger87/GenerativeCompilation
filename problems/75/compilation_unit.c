
extern int strlen(const char *s);

void customFunction(int int1, int int2, 
					double double1, double double2, 
					const char *str1, const char *str2, 
					int *outInt, double *outDouble, char **outString)
{
    *outInt = 0; // unused
    *outDouble = double1 * 100.0;
    *outString = (char *)str1; // just a simple pointer assignment
}
    