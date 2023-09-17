void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    if(double1 >= 10.0) {
        *outInt = int1 + int2;
        return;
    }
    customFunction(int1, int2+1, double1+2, double2, outInt, outDouble);
}