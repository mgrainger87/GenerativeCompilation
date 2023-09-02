
double weightedScore(int score1, int score2, double multiplier1, double multiplier2) {
    return (score1 * multiplier1 + score2 * multiplier2) / (multiplier1 + multiplier2);
}

void customFunction(int int1, int int2, 
                    double double1, double double2, 
                    const char *str1, const char *str2, 
                    int *outInt, double *outDouble, char **outString) {
    *outDouble = weightedScore(int1, int2, double1, double2);
}
