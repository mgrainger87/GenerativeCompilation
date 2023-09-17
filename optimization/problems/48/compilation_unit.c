void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(int2 < 0) {
        *outInt = int1;
        return;
    }
    if(int2 % 2 == 0) {
        customFunction(int1 + 3, int2 - 2, double1, double2, outInt, outDouble);
    } else {
        customFunction(int1 + 4, int2 - 1, double1, double2, outInt, outDouble);
    }
}