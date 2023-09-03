
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int2 * 10;
    int b = a;
    *outInt = b;
    double x = double2 * 2.0;
    double y = x;
    *outDouble = y;
}
