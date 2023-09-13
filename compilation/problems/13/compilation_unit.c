
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int1 == int2) {
        *outInt = int1 * int2;
        *outDouble = double1 + double2;
    } else {
        *outInt = 0;
        *outDouble = 0.0;
    }
}
    