
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (double2 == 0.0) {
        *outDouble = double1;
        return;
    }
    customFunction(int1, int2, double1 - 1.0, double2 - 1.0, outInt, outDouble);
}
