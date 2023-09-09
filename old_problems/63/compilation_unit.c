
static double helper(double val) {
    return val * 2;
}

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    double result = 0;
    for (int i = 0; i < 3; i++) {
        result += helper(double2);
    }
    *outInt = int1;
    *outDouble = result;
}
