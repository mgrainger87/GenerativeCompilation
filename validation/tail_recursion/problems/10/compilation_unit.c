
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int2 == 0) {
        *outInt = (int) double2;
        return;
    }
    customFunction(int1, int2 - 1, double1, double2 - 1.0, outInt, outDouble);
}
