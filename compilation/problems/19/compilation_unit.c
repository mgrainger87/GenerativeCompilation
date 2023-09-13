
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int2 % 3 == 0) ? int1 * int1 : int2 * int2;
    *outDouble = (double1 == double2) ? 0.0 : double1 + double2;
}
    