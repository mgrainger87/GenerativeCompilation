
static int helperFunction(int a, int b) {
    return a + b;
}

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    *outInt = helperFunction(int1, int2);
    *outDouble = double1 + double2;
}
