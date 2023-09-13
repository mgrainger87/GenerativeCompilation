
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = 1;
    for(int i = 1; i <= int1; i++) {
        *outInt *= i;
    }
    *outDouble = 0.0;
}
