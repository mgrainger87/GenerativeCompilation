
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int result = 0;
    for (int i = 0; i < (int1 & 3); i++) {
        result += int2;
    }
    *outInt = result;
    *outDouble = double1 + double2;
}
