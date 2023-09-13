
void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble) {
    for (int i = 0; i < 4; i++) {
        *outDouble = (int1 + int2 + double1 + double2) / 4.0;
    }
}
    