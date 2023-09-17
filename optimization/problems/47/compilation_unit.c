void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int diff = int1 - int2;
    double avg = (double1 + double2) / 2;
    if(diff > 10) {
        *outDouble = avg;
        return;
    }
    customFunction(int2, diff, double2, avg, outInt, outDouble);
}