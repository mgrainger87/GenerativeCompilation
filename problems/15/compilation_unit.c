
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int base = int1 * 2 + int2 / 2;
    if (base > 10) {
        *outInt = base + int1 - int2;
    } else {
        *outInt = base - int1 + int2;
    }
    *outDouble = double1 + double2;
}
    