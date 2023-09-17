void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(int1 == int2) {
        customFunction(int1 + 2, int2, double1, double2, outInt, outDouble);
    } else {
        customFunction(int1, int2 + 2, double1, double2, outInt, outDouble);
    }
}