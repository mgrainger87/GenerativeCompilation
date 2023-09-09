
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int2 == 0) {
        *outDouble = int1 - double1;
        return;
    }
    customFunction(int1 - 1, int2 - 1, double1, double2, outInt, outDouble);
}
