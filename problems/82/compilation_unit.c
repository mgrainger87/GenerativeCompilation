
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 + int2;
    int b = a;
    *outInt = b + int2;
    double x = double1 - double2;
    double y = x;
    *outDouble = y + double1;
}
