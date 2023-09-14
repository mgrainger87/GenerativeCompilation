
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if(double1 == double2) {
        *outInt = int2;
        *outDouble = double2;
    } else {
        customFunction(int1, int2+1, double1-0.1, double2+0.1, outInt, outDouble);
    }
}
    