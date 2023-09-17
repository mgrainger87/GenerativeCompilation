void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(int1 == 100) {
        *outInt = int2;
        return;
    }
    if(int1 < int2) {
        customFunction(int1 + 5, int2 - 5, double1, double2, outInt, outDouble);
    } else {
        customFunction(int1 - 5, int2 + 5, double1, double2, outInt, outDouble);
    }
}