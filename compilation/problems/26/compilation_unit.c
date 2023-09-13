
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = 0;
    for(int i = int1; i <= int2; i++) {
        *outInt += i;
    }
    *outDouble = 0.0;
}
