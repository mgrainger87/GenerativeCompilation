
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    if(int1 == int2) {
        *outInt = int1;
        *outDouble = double1;
    } else {
        customFunction(int1+1, int2-1, double1, double2, outInt, outDouble);
    }
}
    