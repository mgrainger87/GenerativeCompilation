
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int2 == 1) {
        *outInt = int1;
        return;
    }
    customFunction(int1 + int1, int2 - 1, double1, double2, outInt, outDouble);
}
