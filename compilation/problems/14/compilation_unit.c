
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = (int1 < 0) ? -int1 : int1;
    *outDouble = (double2 < 0.0) ? -double2 : double2;
}
    