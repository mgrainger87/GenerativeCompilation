
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    for (int i = 0; i < int1; i++) {
        *outInt = int1 * int2;
    }
    *outInt = int1 + int2;
    for (int j = 0; j < int2; j++) {
        double tmp = double1 * 2;
    }
    *outDouble = double1 + double2;
}
