
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble) {
    for (int i = 0; i < int1; i++) {
        for (int j = 0; j < int2; j++) {
            if (j % 2 == 0) {
                int tmp1 = i + j;
            } else {
                *outInt = int1 + int2;
            }
        }
    }
    *outDouble = double1 + double2;
}
