
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int1 + int2 > 100) {
        *outInt = 100;
        *outDouble = double1 * double2;
    } else {
        *outInt = int1 + int2;
        *outDouble = double1 + double2;
    }
}
    