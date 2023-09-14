
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if(int2 < 5) {
        *outInt = int1;
        *outDouble = double1 + double2;
    } else {
        customFunction(int1, int2-2, double1, double2-1, outInt, outDouble);
    }
}
    