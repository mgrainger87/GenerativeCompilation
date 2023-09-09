
void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    int *outInt, double *outDouble) {
    int product = int1 * int2;
    *outInt = product + product;
    *outDouble = double1 + double2;
}
    