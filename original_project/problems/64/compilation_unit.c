
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    int sum = 0;
    for (int i = 0; i < 2; i++) {
        sum += int2;
    }
    *outInt = sum + int1;
    *outDouble = double1;
}
