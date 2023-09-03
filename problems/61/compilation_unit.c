
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int sum = 0;
    for (int i = 0; i < 4; i++) {
        sum += int1;
    }
    *outInt = sum;
    *outDouble = double1 + double2;
}
