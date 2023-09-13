
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (double1 <= 0.1) {
        *outDouble = double2;
        *outInt = int2;
        return;
    }
    customFunction(int1, int2 + 1, double1 - 0.1, double2 + 0.1, outInt, outDouble);
}
