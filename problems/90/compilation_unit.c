
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    int temp = int1 - int2;
    int a = temp;
    int b = a;
    *outInt = b;
    double tempD = double2 + double1;
    double x = tempD;
    double y = x;
    *outDouble = y;
}
