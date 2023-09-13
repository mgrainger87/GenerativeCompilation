
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outDouble = double1;
    for(int i = 0; i < int1; i++) {
        *outDouble -= double2;
    }
    *outInt = 0;
}
