
#include <stdio.h>


void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString);


int main() {
    int int1 = 2147483647;
    int int2 = 2147483647;
    double double1 = 1.7976931348623157e+308;
    double double2 = 1.7976931348623157e+308;
    const char *str1 = "Max";
    const char *str2 = "Values";
    
    int outInt;
    double outDouble;
    char *outString;

    customFunction(int1, int2, double1, double2, str1, str2, &outInt, &outDouble, &outString);

    printf("Test test5:\n");
    printf("Expected int result: %d\n", int1 * 2 + int2 * 3 + 10);
    printf("Actual int result: %d\n", outInt);
    printf("Expected double result: %lf\n", double1 + double2 + 5.5);
    printf("Actual double result: %lf\n", outDouble);
    return 0;
}
