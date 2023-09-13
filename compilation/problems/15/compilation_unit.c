
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (double1 == 0.0) {
        *outInt = int1 + int2;
        *outDouble = 1.0;
    } else {
        *outInt = int1 - int2;
        *outDouble = double1;
    }
}
    