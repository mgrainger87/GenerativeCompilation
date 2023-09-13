
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 > 10) ? int1 * int2 : int1 + int2;
    *outDouble = (double2 < 5.0) ? double1 : double2;
}
    