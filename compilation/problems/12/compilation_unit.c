
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (double1 > double2) {
        *outInt = int1 + int2;
        *outDouble = double1;
    } else {
        *outInt = int1 - int2;
        *outDouble = double2;
    }
}
    