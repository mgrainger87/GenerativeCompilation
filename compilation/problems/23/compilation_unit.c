
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int1;
    for(int i = 0; i < int2; i++) {
        *outInt *= 2;
    }
    *outDouble = 0.0;
}
