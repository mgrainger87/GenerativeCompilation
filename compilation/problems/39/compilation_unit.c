
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if(double1 < 10) {
        *outInt = int1 * int2;
        *outDouble = double1;
    } else {
        customFunction(int1, int2+2, double1-1, double2+1, outInt, outDouble);
    }
}
    