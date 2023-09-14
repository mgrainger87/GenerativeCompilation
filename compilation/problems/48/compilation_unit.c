
static int helperFunction(int a) {
    return -a;
}

void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    *outInt = helperFunction(int2);
    *outDouble = double1;
}
