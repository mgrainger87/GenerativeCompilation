
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if(double2 <= 0) {
        *outInt = int1;
        *outDouble = double1 + double2;
    } else {
        customFunction(int1+1, int2-1, double1+0.5, double2-0.5, outInt, outDouble);
    }
}
    