
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if (int1 > int2) {
        *outInt = int1;
        *outDouble = double1;
    } else {
        *outInt = int2;
        *outDouble = double2;
    }
}
    