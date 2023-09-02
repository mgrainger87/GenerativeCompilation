
double average(double a, double b) {
    return (a + b) / 2;
}

int aboveThreshold(double value, double threshold) {
    return value > threshold;
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    double avg = average(double1, double2);
    *outInt = aboveThreshold(avg, 10.0);
}
