
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    *outDouble = helperFunction(double1, double2);
    *outInt = int1 - int2;
}

static double helperFunction(double a, double b) {
    return a * b;
}
