
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if(double1 <= 0) {
        *outInt = int1 + int2;
        *outDouble = double2;
    } else {
        customFunction(int1, int2, double1-0.5, double2+0.5, outInt, outDouble);
    }
}
    