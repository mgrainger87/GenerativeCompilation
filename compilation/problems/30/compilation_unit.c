
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    *outInt = int2;
    for(int i = 0; i < (int)double2; i++) {
        *outInt -= int1;
    }
    *outDouble = 0.0;
}
