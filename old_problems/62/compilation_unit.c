
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    double result = 0;
    for (int i = 0; i < 4; i++) {
        result += double1;
    }
    *outInt = int1 + int2;
    *outDouble = result;
}
