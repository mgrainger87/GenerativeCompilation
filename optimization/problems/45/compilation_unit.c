void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(double1 > 50.0) {
        *outDouble = double2 + 5;
        return;
    }
    customFunction(int2, int1, double1 + double2, double1, outInt, outDouble);
}