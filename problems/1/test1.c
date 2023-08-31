
#include <stdio.h>


void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString);


int main() {
    int int1 = 1;
    int int2 = 2;
    double double1 = 1.1;
    double double2 = 2.2;
    const char *str1 = "Hello";
    const char *str2 = "World";
    
    int outInt;
    double outDouble;
    char *outString;

    customFunction(int1, int2, double1, double2, str1, str2, &outInt, &outDouble, &outString);

    printf("Test test1:\n");
    printf("Expected int result: %d\n", int1 * 2 + int2 * 3 + 10);
    printf("Actual int result: %d\n", outInt);
    printf("Expected double result: %lf\n", double1 + double2 + 5.5);
    printf("Actual double result: %lf\n", outDouble);
    return 0;
}
