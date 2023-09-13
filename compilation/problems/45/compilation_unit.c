
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    *outInt = int2;
    *outDouble = helperFunction(double1, double2);
}

static double helperFunction(double a, double b) {
    return a / b;
}
