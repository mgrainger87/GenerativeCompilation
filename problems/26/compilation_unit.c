
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int tmp = int1 + int2;
    tmp = int1 - int2;
    *outInt = tmp;
    *outDouble = double1 + double2;
}
