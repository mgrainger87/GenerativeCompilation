void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    double temp = double1 * 2;
    int sum = int1 + int2;
    if(sum < 20) {
        *outInt = sum * 3;
        return;
    }
    customFunction(int2, sum, temp, double2 + 1, outInt, outDouble);
}