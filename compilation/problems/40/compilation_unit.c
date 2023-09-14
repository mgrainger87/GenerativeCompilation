
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if(double2 < 10) {
        *outInt = int2;
        *outDouble = double1 * double2;
    } else {
        customFunction(int1+2, int2, double1+1, double2-1, outInt, outDouble);
    }
}
    