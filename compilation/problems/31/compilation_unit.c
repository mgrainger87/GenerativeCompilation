
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int1 == 0) {
        *outInt = int2;
        *outDouble = double2;
        return;
    }
    customFunction(int1 - 1, int2 + 1, double1, double2, outInt, outDouble);
}
