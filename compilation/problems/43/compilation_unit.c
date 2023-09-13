
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    *outInt = int1;
    *outDouble = helperFunction(double1);
}

static double helperFunction(double a) {
    return a * a;
}
