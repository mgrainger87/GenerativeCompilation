void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(int2 % 2 == 0) {
        customFunction(int1 + 1, int2, double1, double2, outInt, outDouble);
    } else {
        customFunction(int1, int2 - 1, double1, double2, outInt, outDouble);
    }
}