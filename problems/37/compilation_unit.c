
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int temp = int1;
    temp = int2;
    *outInt = temp;
    *outDouble = double1 + double2;
}
