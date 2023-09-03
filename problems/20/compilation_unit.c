
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int temp1 = int1 + 6 - 3;
    double temp2 = double2 + 1.5 - 0.5;
    *outDouble = temp1 + temp2;
}
