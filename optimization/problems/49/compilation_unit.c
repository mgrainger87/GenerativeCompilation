void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(double2 > 50.0) {
        *outDouble = double1;
        return;
    }
    if(double2 < 10.0) {
        customFunction(int1, int2 + 1, double1 + 2, double2 + 5, outInt, outDouble);
    } else {
        customFunction(int1, int2 + 2, double1 - 2, double2 + 10, outInt, outDouble);
    }
}