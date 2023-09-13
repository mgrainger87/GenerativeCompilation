
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (double2 >= 5.0) {
        *outDouble = double1;
        *outInt = int1;
        return;
    }
    customFunction(int1, int2 + 1, double1 + 0.2, double2 + 0.2, outInt, outDouble);
}
