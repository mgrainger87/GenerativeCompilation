void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(int1 < 10) {
        *outInt = int2 * 2;
        return;
    }
    customFunction(int1 - 10, int1 + int2, double1, double2, outInt, outDouble);
}