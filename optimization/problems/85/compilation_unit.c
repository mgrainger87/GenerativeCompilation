
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int a = int1 - int2;
    int b = a;
    *outInt = b;
    double x = double2 + double1;
    double y = x;
    *outDouble = y;
}
