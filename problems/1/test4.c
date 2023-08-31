
#include <stdio.h>


void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString);


int main() {
    int int1 = 0;
    int int2 = 0;
    double double1 = 0.0;
    double double2 = 0.0;
    const char *str1 = "Zero";
    const char *str2 = "Test";
    
    int outInt;
    double outDouble;
    char *outString;

    customFunction(int1, int2, double1, double2, str1, str2, &outInt, &outDouble, &outString);

    printf("Test test4:\n");
    printf("Expected int result: %d\n", int1 * 2 + int2 * 3 + 10);
    printf("Actual int result: %d\n", outInt);
    printf("Expected double result: %lf\n", double1 + double2 + 5.5);
    printf("Actual double result: %lf\n", outDouble);
    return 0;
}
