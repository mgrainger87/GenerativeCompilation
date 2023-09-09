
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int1 == 0) {
        *outDouble = double1;
        return;
    }
    customFunction(int1 - 1, int2, double1 + 1.0, double2, outInt, outDouble);
}
