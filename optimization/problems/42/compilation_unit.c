void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(int1 <= 0) {
        *outDouble = double2;
        return;
    }
    customFunction(int1-2, int2, double1+1, double2, outInt, outDouble);
}