
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int1 % 2 == 0) {
        *outInt = int1 / 2;
        *outDouble = double1 * 2.0;
    } else {
        *outInt = int1;
        *outDouble = double1;
    }
}
    